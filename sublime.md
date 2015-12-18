# sublime 使用总结


## 快捷键（改为自己习惯的操作，配置文件在后面给出）

上下左右单字节移动, 多字节移动需加上shift

    ctrl+l  右
    ctrl+j  左
    ctrl+i  上
    ctrl+k  下

光标移动至括号内结束或开始的位置

    Ctrl+M 
    Ctrl+Shift+M 选中括号内的内容
选中光标所在整行

    ctrl+n

设置书签

    Ctrl+F2 




## 配置文件


    [
        { "keys": ["ctrl+shift+l"], "command": "move", "args": {"by": "word_ends", "forward": true} },
        { "keys": ["ctrl+shift+j"], "command": "move", "args": {"by": "words", "forward": false} },
        { "keys": ["ctrl+shift+i"], "command": "move", "args": {"by": "lines", "forward": false} },
        { "keys": ["ctrl+shift+k"], "command": "move", "args": {"by": "lines", "forward": true} },
        { "keys": ["ctrl+n"], "command": "expand_selection", "args": {"to": "line"} },
        { "keys": ["ctrl+j"], "command": "move", "args": {"by": "characters", "forward": false} },
        { "keys": ["ctrl+l"], "command": "move", "args": {"by": "characters", "forward": true} },
        { "keys": ["ctrl+i"], "command": "move", "args": {"by": "lines", "forward": false} },
        { "keys": ["ctrl+k"], "command": "move", "args": {"by": "lines", "forward": true} },
        { "keys": ["ctrl+o"], "command": "move", "args": {"by": "characters", "forward": false, "extend": true} },
        { "keys": ["ctrl+p"], "command": "move", "args": {"by": "characters", "forward": true, "extend": true} },
        { "keys": ["ctrl+shift+o"], "command": "move", "args": {"by": "words", "forward": false, "extend": true} },
        { "keys": ["ctrl+shift+p"], "command": "move", "args": {"by": "word_ends", "forward": true, "extend": true} },
    ]
