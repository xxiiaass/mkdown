---
JavaScripe
---


# August 3rd 2015

* fs模块中，writeFileSync(dst, src),可以把src中的内容写到dst中，配合readFileSync(src)使用。fs还有两个方法分别是createReadStream(dstfile),它返回一个流stream，该stream具有一个方法pipe,pipe以一个流作为参数，连通调用pipe的实例和参数。

* process是一个全局变量，可以通过process.argv.slice(n)的方法获取命令行参数，是获取从n开始往后的所有参数，n=0是nodejs程序的绝对路径，n=1是所执行js文件的绝对路径。值得一提的是，slice方法是获取类似于指针的一个东西.

* 

