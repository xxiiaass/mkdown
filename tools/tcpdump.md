# tcpdump抓包命令的使用

###　常用选项记录

-X 详细打印网络包中的每一个字节
-i 指定监听的网卡
-S 打印tcp协议中ack,seq的绝对值
-s n 指定抓包的大小，　一般n=0,　为最大65536
-n 把网络地址的名字转换为数字IP地址

### 常用关键字

tcp, udp 指定监听的网络协议
src, dst, src and dst, dst or src　指定监听的网络包目的来源
host, port, net　指定端口或主机

### 常用实例

**ip协议头20字节，TCPx协议头在http应用中，32字节**

* 抓取3003端口的所有tcp数据包
`tcpdump tcp port 3003 -n -X -s 0 -i lo -S`

* 抓取http网络包
`tcpdump -X -s 0 -i eth0 tcp port 00 and \(tcp[32:2]=0x4745 or tcp[32:2]=0x4854\)`


