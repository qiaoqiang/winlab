$bingwallpaper = Invoke-WebRequest https://bing.ioliu.cn
$bingwallpaper.Content -match "https://h1.ioliu.cn/bing/[A-Za-z]+_ZH-CN[0-9]+_1920x1080.jpg"
# 正则匹配方式，可以得到多个
# $regex = [regex]"https://h1.ioliu.cn/bing/[A-Za-z]+_ZH-CN[0-9]+_1920x1080.jpg"
# $regex.Matches($bingwallpaper)
# 抓取的首页地址里面https://h1.ioliu.cn/bing/SalcombeDevon_ZH-CN5806331292_1920x1080.jpg
# 那么对应的下载地址https://bing.ioliu.cn/photo/SalcombeDevon_ZH-CN5806331292?force=download
$today_photo_url = $matches[0]
# 通过下面字符串替换处理，可以得到下载地址，invoke-webrequest不行invoke-restmethod可以
$today_photo_download = $today_photo_url -replace "h1.ioliu.cn/bing","bing.ioliu.cn/photo"
$today_photo_download = $today_photo_url -replace "_1920x1080.jpg","?force=download"
# $client = New-Object System.Net.WebClient
# $client.DownloadFile('#1', '#2')
# #1是需要下载文件的url
# #2是保存为本地文件的路径，包括文件名
# 例如：
# $client.DownloadFile('https://www.2cto.com/net/201611/562900.html', 'D:/562900.html')
# 下载图片可以用地址https://h1.ioliu.cn/bing/SalcombeDevon_ZH-CN5806331292_1920x1080.jpg
# --------------------- 

$client = New-Object System.Net.WebClient
$client.DownloadFile($today_photo_url, 'C:\Users\Administrator\Desktop\today_photo.jpg')

# 设置脚本执行策略，允许执行脚本
# Set-ExecutionPolicy RemoteSigned
