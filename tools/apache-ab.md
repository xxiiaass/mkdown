## 安装

到apache官网下载源码[下载](http://httpd.apache.org/download.cgi)
解压源码后，开始编译

    ./configure --prefix=/usr/local/apache2　--enable-track-vars --enable-proxy --enable-cgi --enable-so　--enable-mods-shared=all --with-config-file-path=/usr/local/apache2/conf
    make
    sudo make install
    
## 使用

进入源码目录的support文件夹

    ./ab -n 1000 -c 10 http://localhost/
    
10个用户请求1000次，向该url
