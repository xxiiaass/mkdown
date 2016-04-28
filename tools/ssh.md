### 生成密匙

    ssh-keygen -t rsa -C "xxxx@xxx.com"
    
### 保持长链接

在~/.ssh/下添加一个文件config

    ControlMaster auto
     ControlPath /tmp/ssh_mux_%h_%p_%r
    ControlPersist 4h

可以让ssh的连接后台保持连接，这样传输文件或者多次登录时，速度可以得到提升

### ssh用于翻墙

    ssh -f -N -D port user@host

+ -f 表示作为守护进程与行
+ -N 表示不接受shell命令的请求
+ -D 表示端口

## 通过openssl生成密匙对

+ 生成私匙

    openssl genrsa [-aes128 -passout pass:foobar] -out privkey.pem 2048

可以选择是否对私匙文件进行加密，示例中密码为‘foobar’

+ 生成公匙

    openssl rsa -in privkey.pem [-passin pass:foobar] -pubout -out privkey.pub

如果对私匙进行了加密，则生成公匙的时候也需要密码

+ 进行hash计算

    openssl dgst -sha256 [-binary] [-out out.file] input.file

+ 进行签名

    openssl dgst -sha256 -out hello.sig -sign key.pri -keyform PEM hello.txt

+ 公匙校验

    openssl dgst -sha256 -keyform PEM -verify key.pub -signature hello.sig hello.txt

+ 显示完整的签名解密内容

    openssl rsautl -in hello.sig -inkey key.pub -pubin -verify -hexdump [-raw]



### 更改原私匙的passphrase密码

    ssh-keygen -p -f :keyfile
