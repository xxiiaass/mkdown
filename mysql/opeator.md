# 基本操作

### 配置

mac安装

    sudo brew install mysql

登陆

    mysql -u root -p 

修改密码

    set password for root@localhost=password('xxxxxxx');

修改最大执行sql大小
    
    set global max_allowed_packet=1024*1024*16;

查询字符集

  show variables like '%char%';

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


### 集合函数查询

##### count()

+ 显示纪录数的总数

    select count(*) from testtable;

+ 将某个字段的所有值归类,并显示数量

    select age, count(*) from testtable group by age;

##### sum()

    select address, sum(age) from testtable group by address having sum(age)>=4000 order by sum(age);

需要注意的是,having关键字必须出现在group by后面

##### group_concat()

这个函数可以显示出根据group by分组后的组内其他字段所有值, 所以必须和group by搭配使用;

    select address,  group_concat(id) from testtable where id<3000 group by address;

##### avg()平均值函数  max()最大值函数  min()最小值函数

### 子查询

可以使用关键字IN, ANY, ALL, EXISTS以及各种比较操作符(= , >, <, ...)

+ IN是用于有限集的集合

+ EXISTS是判断是否存在, 子查询中有行,返回true, 没有行,返回false, 根据返回值确定是否执行父查询语句

+ ANY, 需要与操作符一起使用, 如 >ANY( sql ), =ANY( sql ) ... ,sql中返回的结果只要有一个满足操作符的条件,那么该表达式的值就为真

+ ALL, 用法与ANY相同, 但是代表需要满足子集中的所有条件, 操作符结果才为真


select r.autokid, r.product_name r.zw_user_code ,u.user_id, u.real_name, r.mobile, r.amount , r.annual_rate , r.bank_name , r.bank_acct , r.is_succeeded , r.ctime,
 from qeeniao_zhiwang.zw_user_has_product r left join qeeniao_zhiwang.zw_user u on r.user_id=u.user_id order by r.ctime DESC limit :offset,:limit

