## 组成
通常HTTP消息包括客户机向服务器的请求消息和服务器向客户机的响应消息。这两种类型的消息由**一个起始行，一个或者多个头域，一个只是头域结束的空行和可选的消息体**组成。HTTP的**头域包括通用头，请求头，响应头和实体头四个部分**。每个头域由一个域名，冒号（:）和域值三部分组成。域名是大小写无关的，域值前可以添加任何数量的空格符，头域可以被扩展为多行，在每行开始处，使用至少一个空格或制表符。

### 通用头域

    Cache-Control、Connection、Date、Pragma、Transfer-Encoding、Upgrade、Via、Cache 

##### Cache-Control
Cache-Control指定请求和响应遵循的缓存机制。在请求消息或响应消息中设置Cache-Control并不会修改另一个消息处理过程中的缓存处理过程。请求时的缓存指令包括no-cache、no- store、max-age、max-stale、min-fresh、only-if-cached，响应消息中的指令包括public、 private、no-cache、no-store、no-transform、must-revalidate、proxy-revalidate、 max-age。

- no-cache指示请求或响应消息不能缓存

##### Date
Date头域表示消息发送的时间.Date描述的时间表示世界标准时，换算成本地时间，需要知道用户所在的时区

### 请求消息
大部分请求头域

    Accept、Accept-Charset、Accept- Encoding、Accept-Language、Authorization、From、Host、If-Modified-Since、If- Match、If-None-Match、If-Range、If-Range、If-Unmodified-Since、Max-Forwards、 Proxy-Authorization、Range、Referer、User-Agent

请求消息的第一行为下面的格式：

    Method　SP　Request-URI　SP　HTTP-Version　CRLF

- Method表示对于Request-URI完成的方法，这个字段是大小写敏感的，包括OPTIONS、GET、HEAD、POST、PUT、DELETE、TRACE。
- SP表示空格
- Request-URI遵循URI格式，在此字段为星号（*）时，说明请求并不用于某个特定的资源地址，而是用于服务器本身。
- HTTP-Version表示支持的HTTP版本，例如为HTTP/1.1。
- CRLF表示换行回车符。\r\n

<hr>

### 相应消息
大部分响应头域

    Age、 Location、Proxy-Authenticate、Public、Retry-After、Server、Vary、Warning、WWW- Authenticate
    
- Location响应头
Location响应头用于重定向接收者到一个新URI地址。

<br>

响应消息的第一行为下面的格式：

    HTTP-Version　SP　Status-Code　SP　Reason-Phrase　CRLF

- HTTP-Version表示支持的HTTP版本，例如为HTTP/1.1。
- Status-Code是一个三个数字的结果代码。
    1xx:信息响应类，表示接收到请求并且继续处理
    2xx:处理成功响应类，表示动作被成功接收、理解和接受
    3xx:重定向响应类，为了完成指定的动作，必须接受进一步处理
    4xx:客户端错误，客户请求包含语法错误或者是不能正确执行
    5xx:服务端错误，服务器不能正确执行一个正确的请求
- Reason-Phrase给Status-Code提供一个简单的文本描述。

<hr>

### 实体信息
请求消息和响应消息都可以包含实体信息，实体信息一般由实体头域和实体组成。实体头域包含关于实体的原信息，实体头包括

    Allow、Content-Base、Content-Encoding、Content-Language、 Content-Length、Content-Location、Content-MD5、Content-Range、Content-Type、 Etag、Expires、Last-Modified、extension-header。

- Content-Type 实体头用于向接收方指示实体的介质类型



