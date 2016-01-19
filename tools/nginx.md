### 安装nginx

    sudo apt-get install nginx
    
### 添加配置文件

配置文件夹在/etc/nginx/*

可以把单独的配置文件添加到con.d文件夹下，会被自动包含

如

    server{
        listen 80; 
        server_name localhost;
        location / { 
            proxy_pass http://localhost:3003;
        }
    }  
