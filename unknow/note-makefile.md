----
About makefile
----

# 在makefile中增加程序的宏定义

使用-D参数， for example

	'gcc -D OS=LINUX test.c'

多个宏定义

	'gcc -D PLAM=ARM -D OS=LINUX test.c'



# makefile的变量使用

### makefile中有一个默认的变量$(CC)=cc ，$(CXX)=g++,

也就是说如果不覆盖CC的值，编译器将默认使用cc(gcc)编译器

##### CFLAGS，CXXFLAGS分别是cc,g++编译器的参数变量，默认为空

如果要使用参数，需要对两个参数赋值，那么在makefile自动推导规则的时候，将使用该参数进行编译

### 对makefile里面的变量赋值

有三种方式

* 可以在makefile文件直接赋值，如 'CC=gcc, CFLAGS=-o -D PALM=LINUX'

* 或者在终端中使用 'export CFLAGS=-o -D PALM=LINUX' ,使用此种方法注意，该变量只有在赋值过的终端中编译才有用，换一个终端后，需要重新赋值变量

* 直接在makefile命令后加入参数的值

'make PALM=Linux'

### makefile中可以使用条件编译

**注意，ifeq后要带一个空格，括号里面不能带空格**
>ifeq ($(V),value)  
	.....  
else  
	....  
endif  




# gcc编译链的记录

### 首先将.c文件，编译成.o文件，使用-c参数

这一步首先检查代码语法错误，**宏定义在这一步中被执行检查**，不需要带.o文件的名字，并且-c在前在后一样 ，such as

'gcc test.c -c' == 'gcc -c test.c'

### 然后将.o编译成可执行文件，使用-o

这一步链接文件，加入链接库等, -o参数可省略，会生成默认的a.out文件，不然生成-o后面名字的可执行文件

'gcc test.o'生成a.out

'gcc -o exefile test.o' == 'gcc test.o -o exefile' 生成exefile



