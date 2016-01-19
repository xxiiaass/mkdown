# 在studio android工程中添加Jni组件

### 先编写调用jni的类

`System.loadLibrary("LIBNAME")`

上面的语句中调用该so库，位置没有规定，但是该语句必须先于调用库函数之前。

`public native xxx xxx();`

然后申明库里面的方法为本地方法，然后make，生成一个.class文件

### 生成jni所需的头文件

进入到{project}/app/src/main/java/目录下，执行

`javah com.xxx.xxx.xx.xxxx`

后面的路径文件名为调用jni方法的.java文件的路径

之后会在当前目录生成一个com.xxx.xxx.xx.xxxx.h的头文件

### 实现jni函数

在当前目录传建一个文件夹"jni",把刚刚生成的头文件移动到该目录下，传建任意文件名的.c文件
　　
在该.c文件中包含该头文件，复制头文件中的函数，然后进行实现

### 配置studio android

在{project}/app/src文件下的build.gradle中，有一个defaultconfig.

在其中添加

> ndk{
	moduleName "xxx"
	abiFileters "armeabi"， "armeabi-v7a"，"x86"
	ldLibs xxx
}

moduleName 为编译成的.so文件的名字，也是一开始引用该库时用的名字

abiFileters　为目标运行的平台类型，有三个，贼会生成三个平台不同的.so

ldLibs 为运行该jni库时需要引用到的其他.so库

在{project}目录下的gradle.properties文件内,添加

`android.useDeprecatedNdk=true`


