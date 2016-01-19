### 生成密匙

    ssh-keygen -t rsa -C "xxxx@xxx.com"
    
### 保持长链接

在~/.ssh/下添加一个文件config

    ControlMaster auto
     ControlPath /tmp/ssh_mux_%h_%p_%r
    ControlPersist 4h

可以让ssh的连接后台保持连接，这样传输文件或者多次登录时，速度可以得到提升

