## 简介

流，是一个很重要的抽象，linux系统中文件系统，tcp等重要数据交互的模块，都可以看到流的抽象

nodejs中，很多模块也用到了流, http.req, http.res, process.stdin, process.stdout等

所有的流都是EventEmitter的实例，是一个复杂的事件集．

主要的三个类有
* 可读流Readable
* 可写流Writeable
* 双工流Duplex，即可读可写

## 主要API及事件

### Readable

Readable流有两种模式，或者说状态，**流动模式**和**暂停模式**

流动模式时，数据自动从底层系统尽快涌出，像一个打开的水龙头．
暂停模式时，数据停留在地层系统，需要使用者主动调用read()读取，就像一个关闭的水龙头，需要水时，打开取水，然后关闭．

#### 进入流动模式的方法

1 添加'data'事件
2 调用resume()方法开启
使用这个方法时，基本上，都是因为对数据不关心，只关心结束事件．
3 调用pipe()管道重定向

#### 进入暂停模式的方法
1 没有导流目标时，调用pause();
2 有目标时，移除所有'data'事件监听，移除所有管道重定向

#### 主要事件

* 'data'，当有数据到来时
* 'end'，当所有数据都传输完毕时
* 'readable'，当数据可以被从流中读出时，一般配合read()使用
* 'close'，当流的发送端被关闭时，不一定所有流都会触发
* 'error'，有错误发生时

#### API

* on(event, handle)．event为需要监听的对象，handle为回调函数，回调参数只有一个data
* read([size])．size为可选的读取数据大小，没有指定，则读取所有可续的．返回一个string，buffer，或者null
* setEncoding(encoding)．设置默认数据的编码，也可以在on中，单独为某个事件指定编码
* resume()．进入流动模式
* pause()．进入暂停模式
* pipe(destination, [options])，destination为目标可写流，返回目标流
* unpipe([destination])．移除某个目标流，不指定，则移除所有

### Writeable

#### 主要事件
 - 'finish' 当end()方法被调用，并且所有数据都被写入系统底层
 - 'pipe' 当自身被设置为某个可读流的对象时触发
 - 'unpipe' 当自身被从某个可读流中接除绑定时触发
 - 'drain' 当write()方法被调用，并且返回false时，可以调用此事件监听该流何时可以继续写入
 

#### 主要API

 1. cork()　强行滞留所有写入
 2. uncork() 接触滞留，并且写入滞留时的数据
 3. end([chunk], [encoding], [callback]) chunk为需要最后写入的数据，　callback等于在监听'finish'事件
 4. writable.write(chunk, [encoding], [callback])
    chunk {String | Buffer} 要写入的数据
    encoding {String} 编码，假如 chunk 是一个字符串
    callback {Function} 数据块写入后的回调
    返回: {Boolean} 如果数据已被全部处理则 true。


### Duplex

同时具有可读流和可写流的所有事件和方法，　如tcp
