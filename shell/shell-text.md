## cut

-d 指定定界符
-f　通过定界符分割后的字段编号
-c　字符编号
-b　字节编号

N   从第1 个开始数的第N 个字节、字符或域
N-  从第N 个开始到所在行结束的所有字符、字节或域
N-M 从第N 个开始到第M 个之间(包括第M 个)的所有字符、字节或域
-M  从第1 个开始到第M 个之间(包括第M 个)的所有字符、字节或

例如：

    $ echo "/home/hello/sdfhssd/sdf" | cut -f 2-4 -d /
    home/hello/sdfhssd

## sort

-r　倒置排序顺序，由小到大变为由大到小
-f 忽略字符大小写
-M 可以对月份的简写排序

    sort -t : -k3 /etc/passwd
    以:为定界符，使用第三个字段,进行排序


## uniq

必须作用于已经排过序的文档

file

    duo
    duo
    tres
    tres
    tres
    unus


    $ sort test | uniq
    duo
    tres
    unus

-c 显示数量计数
-d　只显示有重复的数据
-u　只显示未重复的数据

## fmt

    sed -n -e 9991,10010p /usr/share/dict/words | fmt -w 30

-w 一行最多显示30个字符

-s 只对多出来的行进行操作，对短行不作为


## tail head

-c 显示开头或结尾的字节数　可使用单位2b,6K,M,MB...
    -c -2b则表示除了尾巴的2b不显示，显示其他的

-n 同c，单位为行

tail -f file可以持续监听某个文件的末尾

## od
    od -t x file

    od -v -An -t x1 file
将file以16进制显示m\


## strings

在二进制文件中寻找可能为ascll字符的字符串

## tr

tr [选项]... SET1 [SET2]

-c -C 对SET1取反
-d 删除SET1的字符
-s 对连续的SET1中的字符去重


    tr a-z A-Z file
    将file中的所有小写字符转换为大写字符

