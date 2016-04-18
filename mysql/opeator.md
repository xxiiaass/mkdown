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


### 表的创建与删除

    create table TABLENAME(
      id int AUTO_INCREMENT,
      primary key(id),
      unique index id_idx(id)
    )engine=:InnoDB DEFAULT CHARSET=:utf8;

    drop table TABLENAME;

##### 从文件的sql语句中进行操作

    source :FILEPATH

使用语句前需要先选择数据库。


### 查询操作

    show databases;

显示数据库列表

    show tables;

显示数据库表的列表

  desc TABLENAME;

显示表字段的详细信息

    select :columnName1 [otherName], :columnName2 [otherName], ... from :dataBaseName.tabelName where ... order by :KEY   limit [:BEGINNUM,]:SIZENUM

columnName1为需要获取的列名，可以设置结果集的列别名， *为全部,根据order by 后面的key排序(升序)，再加一个desc则是降序，最大数量显示NUMBER个

#### 功能性关键字

##### in

给出有限的集合，找出[不]符合集合条件的行

    select .... from ...  where id [not] in (id_1, id_2 [, ...]);

##### between .. and ..

给出集合范围，找出[不]符合集合条件的行
  
    select ... from ... where id [not] between 100 and 120;

##### like

通配符匹配查询

    select ...  from ... where id [not] like '_%';

`_` 代表单个任意字符
`%` 代表任意数量的任意字符

##### null

空值查询

    select ... from ... where id [not] is null;

##### distinct

重复消除

    select distinct age from :tablename;

此时将会显示age的所有取值

    select distinct age, id from :tablename;

此时将会以age为序, 显示所有集合

##### group by

分组查询

    select * from testtable group by address;



##### 查看表详细信息

    show create table :TABLENAME

##### 正则查询

    ... where :columnName [NOT] REGEXP '正则表达式'


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

    create table :TABLENAME(
      id int,
      name char, 
      age int,
      index :INDEXNAME (id [, age])
    )
>>>>>>


