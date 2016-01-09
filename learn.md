---
About C, C++
---

# 2015-07-21，Tuesday：

* string使用时，需要包含两个头文件，<string.h>,<iostream>,还有名称空间std；

* mysql的配置文件在/etc/mysql/my.cnf,当mysql报错无法使用/tmp/mysql.sock时，需要找到该sock的文件，然后在/tmp下创建链接到该sock文件的链接文件

* 创建软连接command为  
	`ln -s /source-path  /targit-path  


# 2015-07-23, Thursday:

* android下查看网络地址的命令netcfg  

* adb使用，提示只读文件系统时，应该进入adb shell，然后执行 mount -o remount rw /system

* socket，accpet函数要接受客户端地址时，len参数要设置大小值，否则地址无法接收

* socket, inet_ntop函数，用来将二进制地址转换为点分地址，其中，第二个参数，应该是struct in_addr，这个bug找了好久

* 静态编译需要加上 -static -L.


# 2015-07-25,Saturday

* core文件调试多线程程序。1,ulimit -c unlimited    2,gdb ./main     3,core-file corexxx   4,bt   

* mysql多线程访问会出现错误，目前正在调试


