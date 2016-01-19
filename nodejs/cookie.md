## 在nodejs中操作cookie

express建议使用cookie-parse中间件
使用中间件后，可以在req对象中，访问req.cookies成员获取cookie对象
如果没有使用中间件，需要访问req.headers.cookies成员，访问cookie字符串

### res.cookie(name, value, [options])

这个方法作用是告知客户端，往cookie中，添加一个键值对, 同时可以在options中设置一些属性，比如有效时长，path，domain等

### res.clearCookie(name, [options])

这个方法告知客户端，清除某个键值对，需要注意的是，设置cookie时的options在清除时，也要写上，否则清除不成功．

## 浏览器中操作cookie

浏览器中操作cookie使用 document.cookie，可以进行直接操作，不过应该进行一些封装，更加方便