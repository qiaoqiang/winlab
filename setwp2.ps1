Function Set-DesktopWallPaper($imagePath)
{
    cp $imagePath C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.jpg
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop' -name Wallpaper -value 'C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.jpg'
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

# Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $imagePath
# rundll32.exe user32.dll, UpdatePerUserSystemParameters
#
#使用示例
Set-DesktopWallPaper -imagePath 'C:\Users\Administrator\Desktop\1.jpg'
# 全黑背景
#Set-DesktopWallPaper -imagePath ''
# 壁纸默认位置
# C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper.jpg
