## 备份数据

首先使用mongodump命令备份数据库

    mongodump -d mydb -o backup/

会在backup文件夹下生成一个mydb文件夹，存放数据库文件

生成新数据库

    mongorestore -d newmydb --drop backup/mydb/

如果报错说

    Error creating index newmydb.search: 17280 err: "Btree::insert: key too large to index, failing newmydb.search.$content_text 1582 {．．

是数据库索引的key太长，需要带某个参数重启数据库服务器

    mongod --setParameter failIndexKeyTooLong=false -f /etc/mongodb.conf


