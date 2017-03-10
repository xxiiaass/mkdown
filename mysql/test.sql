
CREATE TABLE testtable(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  age INT NOT NULL ,
  address VARCHAR(50),
  PRIMARY KEY(id),
  UNIQUE INDEX idx_id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into testtable(name, age, address) values ('kevin0', 10, '上海市浦东新区玉兰香苑1');


insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values('1989065',0,0,'Lynn.growing','外媒账号',1479794880,1479794880,1);
insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values('1988973',0,0,'理财师海花','外媒账号',1479794880,1479794880,1);