   M S B A M L   `   `   `  ����b  ^Microsoft.Windows.Shell, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35bFclr-namespace:Microsoft.Windows.Shell;assembly=Microsoft.Windows.ShellMicrosoft.Windows.Shell  5   	   J FDownloadproject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:DownloadprojectDownloadproject 5   	       Downloadproject.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   XshellFclr-namespace:Microsoft.Windows.Shell;assembly=Microsoft.Windows.Shell     5   	   /localclr-namespace:Downloadproject     5   	   MCustom@http://schemas.microsoft.com/winfx/2006/xaml/presentation/ribbon  65     � Title$   ��5   	   $	��377��6   $	��594��6    � WindowStyle$
 None=�5   
    � AllowsTransparency . 
������  � 
ResizeMode$ CanResizeWithGrip=�6Q   .��5      � $��0,0,2,0q�6   .+�5
   
   ��  �� RadiusX$ 10��6   ���	#FFFDFDFD
���   � �� RadiusY$ 10��6A   $��0,0,0,8q�6N      Downloadproject.Downloader  5   
   -   5          Name$ download��5      $
��Auto��6-   $
��Auto��6;   $��	0,0,0,-11q�6H   4  .Microsoft.Windows.Controls.Ribbon.RibbonButton  5   
   -   5          Name$ Close_Button��5         Label$ X��64   $��0,10,5,0q�6>   $��Berlin Sans FB)�6c   $��Right=�6   $��26��6�   $��23��6�   $	��Top=�6�   	   CornerRadius$	 2��6�   ��5      �� 5      
 �� EndPoint$
 0.5,1&�6&    � MappingMode$ RelativeToBoundingBox=�67    �� 
StartPoint$ 0.5,0&�6[   .��5      �  � Color$ Black��6#    � Offset$ 0Q�61   � 5      $ White��6#   � 5      $ 	#FF531A1A��6#   $ 0.947Q�65   � 5      $ 	#FF916363��6#   $
 0.88Q�65   � 5      $ 	#FFD81717��6#   $ 0.107Q�65   5      5        5   
   -   5        $ Maximize_Button��5      $ Maximize��67   $��	0,10,31,0q�6H   $��23��6[   $	��Top=�6g   $��9(�6   $��Berlin Sans FB)�6�   $��Right=�6�   $��46��6�   ��5      �� 5      $
 0.5,1&�6&   $ RelativeToBoundingBox=�67   $ 0.5,0&�6[   .��5      � $ Black��6#   $ 0Q�61   � 5      $ White��6#   � 5      $ Black��6#   $ 1Q�61   � 5      $ 	#FF916363��6#   $ 0.893Q�65   � 5      $ 	#FF3C3030��6#   $ 0.047Q�65   5      5!        5"   
   -   5        $ Maximize_Button_Copy��5"      $ Minimize��6<   $��	0,10,77,0q�6M   $��23��6`   $	��Top=�6l   $��9(�6�   $��Berlin Sans FB)�6�   $��Right=�5#      $��46��6:   ��5$      �� 5%      $
 0.5,1&�6&   $ RelativeToBoundingBox=�67   $ 0.5,0&�6[   .��5&      � $ Black��6#   $ 0Q�61   � 5'      $ White��6#   � 5(      $ Black��6#   $ 1Q�61   � 5)      $ 	#FF916363��6#   $ 0.893Q�65   � 5*      $ 	#FF3C3030��6#   $ 0.047Q�65   5+      5-      5.      5/      