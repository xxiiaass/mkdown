**需要注意的是，所有和网络地址有关的API，都有一个用来监听unix本地套接子的版本，功能一样**

**所有套接字都设置了SO_REUSEADDR，即表示TIME_WAIT状态下的端口可以被立即使用**

## 简单的例子

服务器端:

    var net = require('net');
    var server = net.createServer(function(c) { // 'connection' 监听器
        console.log('服务器已连接');
        c.on('end', function() {
        console.log('服务器已断开');
      });
      c.write('hello\r\n');
      c.pipe(c);
    });
    server.listen(8124, function() { // 'listening' 监听器
      console.log('服务器已绑定');
    });

客户端:

    var net = require('net');
    var client = net.connect({port: 8124},
        function() { //'connect' 监听器
      console.log('client connected');
      client.write('world!\r\n');
    });
    client.on('data', function(data) {
      console.log(data.toString());
      client.end();
    });
    client.on('end', function() {
      console.log('客户端断开连接');
    });
    
## class  net.Server

### server.listen(port, [host], [backlog], [callback]);
backlog：服务器连接等待队列的最大长度，和linux函数中listen()的最后一个参数一样，由不一样的操作系统定义，不得超过操作系统的定义
callback是作为listening事件的监听器

### server.close([callback])
用于停止服务器接受新连接，但保持已存在的连接．服务器将在所有的连接都结束后关闭，并且服务器发送 'close'事件
callback为close事件的监听器

### server.address()
返回监听网络地址的信息

### server.getConnections(callback)
异步获取服务器当前活跃的连接数. 用于套接字呗发送给子进程。
回调函数需要两个参数 err 和 count. 

### 事件: 'listening'
在服务器调用 server.listen绑定后触发。 

### 事件: 'connection'
{Socket object} 
连接对象, 在一个新连接被创建时触发

### 事件: 'close'
当服务被关闭时触发. 是所有连接都结束后才触发

### 事件: 'error'
{Error Object}
当一个错误发生时触发。


