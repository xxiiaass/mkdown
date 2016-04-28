Curl命令的使用
----------

### 查看某个网页

    curl "$URL"

+ -i 显示http协议的所有内容
+ -l　显示html文档的头部信息
+ -v　显示向服务器发送的http请求信息,及各种工作信息

### 向服务器提交数据  

+ GET方法
    `curl "http://xxx.xx.xx.xx/xxx?name=xxx&age=xxx"`

+ POST方法   
    `curl -d "name=xxx&age=xxx" "http://xxxx.xxx.xx/xxx"`
    
+ POST传输文件，例如，一个name=upload的input标签, type=file, 他的父级form标签，enctype=multipart/form-data，　现在要传输一个file.png的二进制文件　　
    `curl -F "upload=@file.png;type=image/png" $URL`

### 下载文件　　

    curl -o $save_name $URL

实际测试结果，速度很慢，不知道什么原因，同样一个文件，wget速度快很多

    wget $URL

### 使用cookie

访问某个网站时，响应网站设置cookie的请求，保存cookie至指定文件
    `curl -c ./cookies http://localshot:3003`

访问某个资源时，携带某文件中的cookie信息
    `curl -b ./cookies http://localshot:3003`

访问某个资源时，携带指定的cookie信息
    `curl -b "name=kevin;age=26" http://localshot:3003`