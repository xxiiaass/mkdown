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

完整一些的为

    server{
        listen 80;
        server_name talk.radxa.com;
        location / {
            proxy_pass http://127.0.0.1:3003;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;

            proxy_redirect off;

            # Socket.IO Support
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
        }
    }
