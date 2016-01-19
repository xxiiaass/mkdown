## 配置

在bin/www文件中，　添加以下代码

    var log4js = require('log4js');
    log4js.configure('./log/logconfig.json');
    var log = log4js.getLogger("startup");

在app.js中，添加以下代码

    var log4js = require('log4js');
    var loggers = log4js.getLogger('app');
    loggers.setLevel('INFO');
    
    app.use(log4js.connectLogger(log4js.getLogger("http"), { level: 'auto' }));
    
在项目根目录下新建log文件夹，文件夹下兴建一个logs文件夹，以及logconfig.json文件，json文件存放配置，logs文件夹存放日志文件
json文件为

    {
      "appenders": [
        {
          "type": "clustered",
          "appenders": [
            {
              "type": "file",
              "filename": "log/logs/app.log",
              "maxLogSize": 10485760,
              "numBackups": 3
            },
            {
              "type": "logLevelFilter",
              "level": "ERROR",
              "appender": {
                "type": "file",
                "filename": "log/logs/errors.log"
              }
            }
          ]
        }
      ]
    }
    
##　使用
    
如果需要在某个模块内打印日志

    var logger = require('log4js').getLogger("index");
    
打印出的信息会附带index

    logger.error(err);
    logger.debug(debug);
    logger.info(info);
    ...
共六个级别日志

具体信息需要去npm模块的官网文档查看
