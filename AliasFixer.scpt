FasdUAS 1.101.10   ��   ��    k             l     ��  ��    > 8 Always have the last colon in place i.e. "MacintoshHD:"     � 	 	 p   A l w a y s   h a v e   t h e   l a s t   c o l o n   i n   p l a c e   i . e .   " M a c i n t o s h H D : "   
  
 l     ����  r         m        �    S a n D i s k C r u z e r :  o      ���� (0 startingfoldername startingFolderName��  ��        l     ��������  ��  ��        l     ��  ��    > 8 Always have the last colon in place i.e. "MacintoshHD:"     �   p   A l w a y s   h a v e   t h e   l a s t   c o l o n   i n   p l a c e   i . e .   " M a c i n t o s h H D : "      l    ����  r        m       �   N M a i n D r i v e : U s e r s : p a l o u l : D e s k t o p : A l i a s e s :  o      ���� (0 oldaliasroottarget oldAliasRootTarget��  ��         l     ��������  ��  ��      ! " ! l     �� # $��   # > 8 Always have the last colon in place i.e. "MacintoshHD:"    $ � % % p   A l w a y s   h a v e   t h e   l a s t   c o l o n   i n   p l a c e   i . e .   " M a c i n t o s h H D : " "  & ' & l    (���� ( r     ) * ) m    	 + + � , ,  S a n D i s k C r u z e r : * o      ���� (0 newaliasroottarget newAliasRootTarget��  ��   '  - . - l     ��������  ��  ��   .  / 0 / l    1���� 1 I    �� 2���� 0 process_folder   2  3 4 3 m     5 5 � 6 6   4  7 8 7 o    ���� (0 startingfoldername startingFolderName 8  9 : 9 o    ���� (0 oldaliasroottarget oldAliasRootTarget :  ;�� ; o    ���� (0 newaliasroottarget newAliasRootTarget��  ��  ��  ��   0  < = < l     ��������  ��  ��   =  > ? > i      @ A @ I      �� B���� 0 process_folder   B  C D C o      ���� 0 root   D  E F E o      ���� (0 startingfoldername startingFolderName F  G H G o      ���� (0 oldaliasroottarget oldAliasRootTarget H  I�� I o      ���� (0 newaliasroottarget newAliasRootTarget��  ��   A O     � J K J k    � L L  M N M r     O P O n     Q R Q 2   
 ��
�� 
file R 4    
�� S
�� 
cfol S l   	 T���� T b    	 U V U o    ���� 0 root   V o    ���� (0 startingfoldername startingFolderName��  ��   P o      ���� 0 theitems theItems N  W X W X    \ Y�� Z Y Z    W [ \���� [ =   $ ] ^ ] n    " _ ` _ m     "��
�� 
pcls ` o     ���� 0 thefile theFile ^ m   " #��
�� 
alia \ k   ' S a a  b c b l  ' '�� d e��   d G A Main logic area where a file determined as an alias is processed    e � f f �   M a i n   l o g i c   a r e a   w h e r e   a   f i l e   d e t e r m i n e d   a s   a n   a l i a s   i s   p r o c e s s e d c  g h g l  ' '��������  ��  ��   h  i j i l  ' '�� k l��   k : 4 store the alias path and alias target path as temps    l � m m h   s t o r e   t h e   a l i a s   p a t h   a n d   a l i a s   t a r g e t   p a t h   a s   t e m p s j  n o n l  ' , p q r p r   ' , s t s c   ' * u v u o   ' (���� 0 thefile theFile v m   ( )��
�� 
ctxt t o      ���� 0 thealias theAlias q + % the current alias file's actual path    r � w w J   t h e   c u r r e n t   a l i a s   f i l e ' s   a c t u a l   p a t h o  x y x l  - 7 z { | z r   - 7 } ~ } c   - 5  �  n   - 3 � � � 1   1 3��
�� 
orig � 4   - 1�� �
�� 
file � o   / 0���� 0 thealias theAlias � m   3 4��
�� 
ctxt ~ o      ���� 0 theoldtarget theOldTarget { "  the current target of alias    | � � � 8   t h e   c u r r e n t   t a r g e t   o f   a l i a s y  � � � l  8 8��������  ��  ��   �  � � � l  8 8�� � ���   � L F replace the root target with the new target of the alias' old target     � � � � �   r e p l a c e   t h e   r o o t   t a r g e t   w i t h   t h e   n e w   t a r g e t   o f   t h e   a l i a s '   o l d   t a r g e t   �  � � � r   8 J � � � c   8 H � � � n   8 F � � � I   9 F�� ����� 0 replace_chars   �  � � � c   9 < � � � o   9 :���� 0 theoldtarget theOldTarget � m   : ;��
�� 
ctxt �  � � � c   < ? � � � o   < =���� (0 oldaliasroottarget oldAliasRootTarget � m   = >��
�� 
ctxt �  ��� � c   ? B � � � o   ? @���� (0 newaliasroottarget newAliasRootTarget � m   @ A��
�� 
ctxt��  ��   �  f   8 9 � m   F G��
�� 
ctxt � l      ����� � o      ���� 0 thenewtarget theNewTarget��  ��   �  � � � l  K K�� � ���   � # display dialog (theOldTarget)    � � � � : d i s p l a y   d i a l o g   ( t h e O l d T a r g e t ) �  � � � l  K K�� � ���   � # display dialog (theNewTarget)    � � � � : d i s p l a y   d i a l o g   ( t h e N e w T a r g e t ) �  � � � l  K K��������  ��  ��   �  � � � l  K K�� � ���   � F @ The following line actually alters the target of the alias file    � � � � �   T h e   f o l l o w i n g   l i n e   a c t u a l l y   a l t e r s   t h e   t a r g e t   o f   t h e   a l i a s   f i l e �  � � � l  K K�� � ���   � H B Set the new target with the new root to the alias' current target    � � � � �   S e t   t h e   n e w   t a r g e t   w i t h   t h e   n e w   r o o t   t o   t h e   a l i a s '   c u r r e n t   t a r g e t �  ��� � r   K S � � � o   K L���� 0 thenewtarget theNewTarget � n       � � � 1   P R��
�� 
orig � 4   L P�� �
�� 
file � o   N O���� 0 thealias theAlias��  ��  ��  �� 0 thefile theFile Z o    ���� 0 theitems theItems X  � � � l  ] ]��������  ��  ��   �  � � � l  ] ]��������  ��  ��   �  � � � l  ] ]�� � ���   � B <	Find the folders in the root path described by "foldername"    � � � � x 	 F i n d   t h e   f o l d e r s   i n   t h e   r o o t   p a t h   d e s c r i b e d   b y   " f o l d e r n a m e " �  � � � l  ] ]�� � ���   � < 6	and recursively run this method on all found folders.    � � � � l 	 a n d   r e c u r s i v e l y   r u n   t h i s   m e t h o d   o n   a l l   f o u n d   f o l d e r s . �  � � � l  ] ]�� � ���   � = 7	No need to change any of this below. Generic recursive    � � � � n 	 N o   n e e d   t o   c h a n g e   a n y   o f   t h i s   b e l o w .   G e n e r i c   r e c u r s i v e �  � � � l  ] ]�� � ���   � - '	way of drilling down all child folders    � � � � N 	 w a y   o f   d r i l l i n g   d o w n   a l l   c h i l d   f o l d e r s �  � � � r   ] i � � � n   ] g � � � 1   e g��
�� 
pnam � n   ] e � � � 2  c e��
�� 
cfol � 4   ] c�� �
�� 
cfol � l  _ b ����� � b   _ b � � � o   _ `���� 0 root   � o   ` a���� (0 startingfoldername startingFolderName��  ��   � o      ���� 0 
thefolders 
theFolders �  ��� � X   j � ��� � � k   z � � �  � � � s   z � � � � c   z } � � � o   z {���� 0 	thefolder 	theFolder � m   { |��
�� 
TEXT � o      ���� 0 thefoldername TheFolderName �  � � � l  � ��� � ���   � F @display dialog (root & startingFolderName & TheFolderName & ":")    � � � � � d i s p l a y   d i a l o g   ( r o o t   &   s t a r t i n g F o l d e r N a m e   &   T h e F o l d e r N a m e   &   " : " ) �  ��� � Q   � � � � � � n  � � � � � I   � ��� ����� 0 process_folder   �  � � � b   � � � � � o   � ����� 0 root   � o   � ����� (0 startingfoldername startingFolderName �  � � � b   � � � � � o   � ����� 0 thefoldername TheFolderName � m   � � � � �    : �  o   � ����� (0 oldaliasroottarget oldAliasRootTarget �� o   � ��� (0 newaliasroottarget newAliasRootTarget��  ��   �  f   � � � R      �~
�~ .ascrerr ****      � **** o      �}�} 0 errstr errStr �|�{
�| 
errn o      �z�z 0 errornumber errorNumber�{   � I  � ��y�x
�y .sysodlogaskr        TEXT o   � ��w�w 0 errstr errStr�x  ��  �� 0 	thefolder 	theFolder � o   m n�v�v 0 
thefolders 
theFolders��   K m     �                                                                                  MACS  alis    l  	MainDrive                  �?�NH+  �IH
Finder.app                                                     ��i�pi�        ����  	                CoreServices    �?��      �p�J    �IH�IG�IF  3MainDrive:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p   	 M a i n D r i v e  &System/Library/CoreServices/Finder.app  / ��   ? 	
	 l     �u�t�s�u  �t  �s  
  i    I      �r�q�r 	0 split    o      �p�p 0 astring aString �o o      �n�n 0 	delimiter  �o  �q   k     !  r      J     �m�m   o      �l�l 0 retval retVal  r    
 n    1    �k
�k 
txdl 1    �j
�j 
ascr o      �i�i 0 prevdelimiter prevDelimiter  r     !  J    "" #�h# o    �g�g 0 	delimiter  �h  ! n     $%$ 1    �f
�f 
txdl% 1    �e
�e 
ascr &'& r    ()( n    *+* 2    �d
�d 
citm+ o    �c�c 0 astring aString) o      �b�b 0 retval retVal' ,-, r    ./. o    �a�a 0 prevdelimiter prevDelimiter/ n     010 1    �`
�` 
txdl1 1    �_
�_ 
ascr- 2�^2 L    !33 o     �]�] 0 retval retVal�^   454 l     �\�[�Z�\  �[  �Z  5 676 i    898 I      �Y:�X�Y 0 replace_chars  : ;<; o      �W�W 0 	this_text  < =>= o      �V�V 0 search_string  > ?�U? o      �T�T 0 replacement_string  �U  �X  9 k      @@ ABA r     CDC l    E�S�RE o     �Q�Q 0 search_string  �S  �R  D n     FGF 1    �P
�P 
txdlG 1    �O
�O 
ascrB HIH r    JKJ n    	LML 2    	�N
�N 
citmM o    �M�M 0 	this_text  K l     N�L�KN o      �J�J 0 	item_list  �L  �K  I OPO r    QRQ l   S�I�HS o    �G�G 0 replacement_string  �I  �H  R n     TUT 1    �F
�F 
txdlU 1    �E
�E 
ascrP VWV r    XYX c    Z[Z l   \�D�C\ o    �B�B 0 	item_list  �D  �C  [ m    �A
�A 
TEXTY o      �@�@ 0 	this_text  W ]^] r    _`_ m    aa �bb  ` n     cdc 1    �?
�? 
txdld 1    �>
�> 
ascr^ e�=e L     ff o    �<�< 0 	this_text  �=  7 g�;g l     �:�9�8�:  �9  �8  �;       �7hijkl�7  h �6�5�4�3�6 0 process_folder  �5 	0 split  �4 0 replace_chars  
�3 .aevtoappnull  �   � ****i �2 A�1�0mn�/�2 0 process_folder  �1 �.o�. o  �-�,�+�*�- 0 root  �, (0 startingfoldername startingFolderName�+ (0 oldaliasroottarget oldAliasRootTarget�* (0 newaliasroottarget newAliasRootTarget�0  m �)�(�'�&�%�$�#�"�!� �����) 0 root  �( (0 startingfoldername startingFolderName�' (0 oldaliasroottarget oldAliasRootTarget�& (0 newaliasroottarget newAliasRootTarget�% 0 theitems theItems�$ 0 thefile theFile�# 0 thealias theAlias�" 0 theoldtarget theOldTarget�! 0 thenewtarget theNewTarget�  0 
thefolders 
theFolders� 0 	thefolder 	theFolder� 0 thefoldername TheFolderName� 0 errstr errStr� 0 errornumber errorNumbern ������������ ����p�
� 
cfol
� 
file
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcls
� 
alia
� 
ctxt
� 
orig� 0 replace_chars  
� 
pnam
� 
TEXT� � 0 process_folder  � 0 errstr errStrp ��
�	
� 
errn�
 0 errornumber errorNumber�	  
� .sysodlogaskr        TEXT�/ �� �*ᠡ%/�-E�O L�[��l kh ��,�  1��&E�O*�/�,�&E�O)��&��&��&m+ 
�&E�O�*�/�,FY h[OY��O*ᠡ%/�-�,E�O 8�[��l kh 
��&EQ�O )��%��%���+ W X  �j [OY��Uj ���qr�� 	0 split  � �s� s  ��� 0 astring aString� 0 	delimiter  �  q �� ����� 0 astring aString�  0 	delimiter  �� 0 retval retVal�� 0 prevdelimiter prevDelimiterr ������
�� 
ascr
�� 
txdl
�� 
citm� "jvE�O��,E�O�kv��,FO��-E�O���,FO�k ��9����tu���� 0 replace_chars  �� ��v�� v  �������� 0 	this_text  �� 0 search_string  �� 0 replacement_string  ��  t ���������� 0 	this_text  �� 0 search_string  �� 0 replacement_string  �� 0 	item_list  u ��������a
�� 
ascr
�� 
txdl
�� 
citm
�� 
TEXT�� !���,FO��-E�O���,FO��&E�O���,FO�l ��w����xy��
�� .aevtoappnull  �   � ****w k     zz  
{{  ||  &}}  /����  ��  ��  x  y 	 �� �� +�� 5������ (0 startingfoldername startingFolderName�� (0 oldaliasroottarget oldAliasRootTarget�� (0 newaliasroottarget newAliasRootTarget�� �� 0 process_folder  �� �E�O�E�O�E�O*�����+  ascr  ��ޭ