$bing = Invoke-WebRequest https://www.bing.com
# bing官方的地址格式
# https://cn.bing.com/th?id=OHR.KingsWalkway_ZH-CN5988888672_1920x1080.jpg
$bing.Content -match "id=OHR.[A-Za-z]+_ZH-CN[0-9]+_1920x1080.jpg"
$today_photo_url = "https://cn.bing.com/th?" + $matches[0]
# $client = New-Object System.Net.WebClient
# $client.DownloadFile('#1', '#2')
# #1是需要下载文件的url
# #2是保存为本地文件的路径，包括文件名

$client = New-Object System.Net.WebClient
$client.DownloadFile($today_photo_url, 'C:\Users\Administrator\Desktop\today_photo.jpg')

# 设置脚本执行策略，允许执行脚本
# Set-ExecutionPolicy RemoteSigned
