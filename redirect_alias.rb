#!/usr/bin/ruby -w
#
#   file :
#       redirect_aliases.rb
# 
#   ARGV :
#       [directory, search, replace]
#           directory : POSIX path of directory which target tree is rooted at
#           search    : search string in alias's target path
#           replace   : replace string
# 
#   This script will resolve each alias file under specified <directory>, 
#   build new target path by replacing <search> string with <replace> string in original target path,
#   and replace the original alias file with new alias file linked to new target.
# 
#   * If original alias file is unresolvable, it is labeled by gray colour.
#   * If new target does not exist, the original alias file is preserved and labeled by red colour.
#   * Alias resolution is static, i.e., target volume must be mounted in advance.
#   * Package contents are not scanned.
#   
#   version :
#       v0.10
# 
#   written by Hiroto, 2015-09
# 
require 'osx/cocoa'
include OSX

begin
    URLKEY = NSURLPathKey   # 10.8 or later
rescue
    URLKEY = NSURLNameKey   # 10.6 or later (fallback)
end

def resolve_alias(f, opts = {})
    #   string f : POSIX path of alias file
    #   hash opts : {:quiet => boolean}
    #       :quiet => true to suppress error message, false otherwise; default = false
    #   return array : [rc, f1]
    #       rc = return code 
    #           0 = alias is resolved
    #           1 = alias is not resolved but target is retrieved
    #           2 = target is not retrieved
    #           3 = bookmark data is not obtained (e.g., f is not alias)
    #       f1 = POSIX path of target file or nil if failed
    opts = {:quiet => false}.merge(opts)
    url = NSURL.fileURLWithPath(f)
    err = OCObject.new
    bmrk = NSURL.objc_send(
        :bookmarkDataWithContentsOfURL, url, 
        :error, err)
    unless bmrk
        $stderr.puts %[%s: failed to get bookmark data - %s] % [f, err] unless opts[:quiet]
        return [3, nil]
    end
    
    stale = ObjcPtr.new(:char)  # BOOL*
    err = OCObject.new
    url1 = NSURL.objc_send(
        :URLByResolvingBookmarkData, bmrk,
        :options, NSURLBookmarkResolutionWithoutMounting | NSURLBookmarkResolutionWithoutUI,
        :relativeToURL, nil,
        :bookmarkDataIsStale, stale,
        :error, err)
    unless url1
        $stderr.puts %[%s: failed to resolve alias - %s] % [f, err] unless opts[:quiet]
        dict = NSURL.objc_send(
            :resourceValuesForKeys, [URLKEY],
            :fromBookmarkData, bmrk)
        path2 = dict[URLKEY]
        unless path2
            $stderr.puts %[s: failed to get target path - %s] % [f, err] unless opts[:quiet]
            return [2, nil]
        else
            return [1, path2]
        end
    end
    if stale.bool != 0
        $stderr.puts %[%s: stale alias] % f unless opts[:quiet]
    end
    return [0, url1.path]
end

def create_alias(g, f, opts = {})
    #   string g : POSIX path of original file (target of alias file)
    #   string f : POSIX path of alias file
    #   hash opts : {:quiet => boolean}
    #       :quiet => true to suppress error message, false otherwise; default = false
    #   return array : [rc, f1]
    #       rc = return code 
    #           0 = alias file is created successfully
    #           1 = bookmark data is created but not written to alias file
    #           2 = bookmark data is not created (e.g., g does not exist)
    #       f1 = POSIX path of alias file or nil if failed
    opts = {:quiet => false}.merge(opts)
    err = OCObject.new
    bmrk = NSURL.fileURLWithPath(g).objc_send(
        :bookmarkDataWithOptions, NSURLBookmarkCreationSuitableForBookmarkFile,
        :includingResourceValuesForKeys, [],
        :relativeToURL, nil,
        :error, err)
    unless bmrk
        $stderr.puts %[%s: failed to create bookmark data - %s] % [g, err] unless opts[:quiet]
        return [2, nil]
    end
    err = OCObject.new
    url = NSURL.fileURLWithPath(f)
    b = NSURL.objc_send(
        :writeBookmarkData, bmrk,
        :toURL, url,
        :options, NSURLBookmarkCreationSuitableForBookmarkFile,
        :error, err)
    unless b
        $stderr.puts %[%s: failed to write bookmark data - %s] % [f, err] unless opts[:quiet]
        return [1, nil]
    end
    return [0, url.path]
end

def scan_aliases(p, opts = {})
    #   string p : absolute POSIX path of directory or file
    #   hash opts : {:package => boolean}
    #       :package => true to scan package contents, false otherwise; default = false
    #   return array : aliases in directory tree rooted at p if p is directory; [p] if p is alias file; otherwise []
    opts = {:package => false}.merge(opts)
    aa = []
    ws = NSWorkspace.sharedWorkspace
    uti = ws.typeOfFile_error(p, nil)
    if ['public.folder', 'public.volume'].include?(uti)
        de = NSFileManager.defaultManager.enumeratorAtPath(p)
        while (n = de.nextObject) != nil do
            f = p + '/' + n.to_s
            de.skipDescendants if ! opts[:package] && ws.isFilePackageAtPath(f)
            if de.fileAttributes.objectForKey(NSFileType) == NSFileTypeRegular
                aa << f if ws.typeOfFile_error(f, nil) == 'com.apple.alias-file'
            end
        end
    elsif uti == 'com.apple.alias-file'
        aa << p
    end
    aa
end

def set_label(f, lb, opts = {})
    #   string f : POSIX path of file or directory
    #   integer lb : label index
    #       label index => colour
    #                 0 => none
    #                 1 => gray
    #                 2 => green
    #                 3 => purple
    #                 4 => blue
    #                 5 => yellow
    #                 6 => red
    #                 7 => orange
    #   hash opts : {:quiet => boolean}
    #       :quiet => true to suppress error message, false otherwise; default = false
    #   return boolean : true if successful, false otherwise.
    opts = {:quiet => false}.merge(opts)
    err = OCObject.new
    b = NSURL.fileURLWithPath(f).objc_send(
        :setResourceValue, NSNumber.numberWithInt(lb),
        :forKey, NSURLLabelNumberKey,
        :error, err)
    unless b
        $stderr.puts '%s: failed to set label index to %d - %s' % [f, lb, err] unless opts[:quiet]
    end
    b
end

def main(argv)
    #d = File.expand_path(argv.shift)
    #s, r, = argv
    
    # d = the directory path to start searching for alias files
    # s = the old target root path to search for in alias files
    # r = the new target root path to replace with in alias files
    
    d = '/Volumes/Disk1'
    s = '/Volumes/DiskOld/'
    r = '/Volumes/Disk1/'
    
    scan_aliases(d).each do |f|
        rc, g = resolve_alias(f)
        # GKP: RC==0 if existing target alias is resolved,
        # GKP: RC==1 when target alias not resolved but retrieved
        if rc == 0 || rc == 1 
            g1 = g.sub(s, r)
            next if g1 == g
            $stdout.puts '%s: Redirecting alias - Attempting to replace Old Target (%s) with New Target (%s)' % [f, g, g1]
            if File.exist?(g1)
                File.delete(f)  # this should not be necessary but is to update Finder's cache assuredly
                create_alias(g1, f)
                $stdout.puts '%s: Alias Redirect Success - New Target (%s)' % [f, g1]
            else
                # unresolvable redirection (new target does not exist)
                $stderr.puts '%s: failed to redirect alias - Your new target (%s) does not exist.' % [f, g1]
                set_label(f, 6)
            end
        else
            # originally unresolvable alias
            set_label(f, 1)
            $stderr.puts '%s: failed to redirect alias - Unable to resolve and/or extract existing target (%s) from alias.' % [f, g]
        end
    end
end

main(ARGV)