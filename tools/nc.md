    nc localhost 3003
开始向localhost:3003发送数据，　从终端输入，　作为客户端运行

    nc -lk localhost 3003
持续监听localhost:3003端口，作为服务器运行

#### 常用选项

* -C 把换行作为\r\n，用于输入http协议
* -u 使用udp协议，默认为tcp
* -U 使用unix本地套接字
* -l 作为服务器运行 
* -k 持续作为服务器，必须于l一起使用
* -n 使用数字ip作为地址
* -s 使用指定IP作为发出数据包的IP地址来源