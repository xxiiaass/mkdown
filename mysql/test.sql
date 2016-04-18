
CREATE TABLE testtable(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  age INT NOT NULL ,
  address VARCHAR(50),
  PRIMARY KEY(id),
  UNIQUE INDEX idx_id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into testtable(name, age, address) values ('kevin0', 10, '上海市浦东新区玉兰香苑1');