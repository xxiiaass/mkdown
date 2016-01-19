## clss http.Server

通过http.createServer()创建
这个类包含下列事件
### 事件:request
    `function (request, response) { }`
每次收到一个请求时触发.注意每个连接又可能有多个请求(**在keep-alive的连接中**).request是http.IncomingMessage的一个实例.response是http.ServerResponse的一个实例 

### 事件:connection 
    `function (socket) { }`
新的TCP流建立时出发。 socket是一个net.Socket对象

### 事件:close
    `function () { }`
当此服务器关闭时触发 

### 事件:checkContinue
    `function (request, response) { }`
每当收到"Expect: 100-continue"的http请求时触发。 如果未监听该事件，服务器会自动判定是否发送"100 Continue"响应.希望继续发送，则使用`response.writeContinue`, 否则回复其他(如404)．**某个请求触发这个事件后，不会再次触发request请求**

### 事件:connect
    `function (request, socket, head) { }`
每当客户端发起CONNECT请求时出发。如果未监听该事件，客户端发起CONNECT请求时连接会被关闭

### server.setTimeout(msecs, callback)
为套接字设定超时值。如果一个超时发生，那么Server对象上会分发一个'timeout'事件，同时将套接字作为参数传递


