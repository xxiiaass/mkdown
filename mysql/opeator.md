# 基本操作

### 配置

mac安装

  sudo brew install mysql

登陆

  mysql -u root -p 

修改密码

  set password for root@localhost=password('xxxxxxx');


### 创建删除操作

  create database DATABASENAME;

创建数据库

  drop database DATABASENAME;

删除数据库

  create table TABLENAME(...)

  drop table TABLENAME;


### 查询操作

  show databases;

显示数据库列表

  show tables;

显示数据库表的列表

  desc TABLENAME;

显示表字段的详细信息

  select columnName1 [otherName], columnName2 [otherName], ... from dataBaseName.tabelName where ... order by KEY  limit NUMBER

columnName1为需要获取的列名，可以设置结果集的列别名， *为全部,根据order by 后面的key排序(升序)，再加一个desc则是降序，最大数量显示NUMBER个

### 插入操作

  insert into TABLENAME (KEYS, ...) values (VALUES, ...);

  replace into TABLENAME (KEYS, ...) values (VALUES, ...);

上面两个的命令不同之处在于，当表中某个字段为‘primary key’的时候，insert into无法插入该字段相同的数据，而replace则可以把原数据替换。如果改字段不是‘primary key'属性，则replace也是再次插入一条新数据。


### 联表查询

三组关键字 left join, right join, inner join . 

  select aNewName.column1, aNewName.column2, bNewName.column1 from TABLE_A aNewName left join TABLE_B bNewName on aNewName.columnN=bNewName.columnM where ...

left join 以TABLE_A为基准，显示全部a和on后面条件的TABLE_B
right join 则与left join相反
inner join 则止显示满足on后面条件的行

### 创建索引

在创建表的同时创建索引

  create table NAME(id primary key, unique index index_id (id desc));

在已有的表上创建索引

  create unique index index_id on NAME(id);


