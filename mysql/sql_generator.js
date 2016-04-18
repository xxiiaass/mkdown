var fs = require('fs');

for(var i = 0; i < 10000; i++){
  var sql = `insert into testtable(name, age, address) values ('kevin${i}', ${i%20+10}, '上海市浦东新区玉兰香苑${i%50+1}');\n`;
  fs.appendFileSync('./insert.sql', sql);
}
