#修正公众号之前的点赞数据

insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (117440, 357) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=357       |


insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (117440  , 357   ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=357 ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1015352 , 0     ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=0   ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1178057 , 0     ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=0   ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1367745 , 1     ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=1   ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1494333 , 152   ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=152 ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1494368 , 1798  ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=1798;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1685890 , 5860  ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=5860;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1693017 , 0     ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=0   ;
insert into qeeniao_sns.user_event_count(`user_id`, `receive_like_article_cnt`) values (1737877 , 97    ) ON DUPLICATE KEY UPDATE  `receive_like_article_cnt`=97  ;




select 
count.user_id, 
user.nick,
post_feed_cnt, 
post_like_feed_cnt+post_like_article_cnt+post_like_feed_comment_cnt+post_like_article_comment_cnt as like_cnt, post_comment_feed_cnt+post_comment_article_cnt as comment_cnt ,
jiufu.`amount`, 
zhiwang.`amount`/100 
from  `qeeniao_sns`.`user_event_count` count 
left join `qeeniao_jiufu`.`user_count` jiufu on count.`user_id` = jiufu.`user_id` 
left join `qeeniao_zhiwang`.`user_count` zhiwang on count.`user_id`=zhiwang.`user_id` 
left join `qeeniao`.`user` user on count.`user_id`=user.user_id
where 
`post_feed_cnt` > 0  
OR post_like_feed_cnt+post_like_article_cnt+post_like_feed_comment_cnt+post_like_article_comment_cnt>0 
OR post_comment_feed_cnt+post_comment_article_cnt>0 
OR zhiwang.`amount`>0 
OR jiufu.amount>0;


SELECT * FROM `qeeniao_sns`.`sns_event_0` as event left join `qeeniao_sns`.`feed_0` as feed on event.`feed_id`=feed.`feed_id`   WHERE `event_type` =3 AND `event_entity` =1 and feed.`feed_type` =2;


insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values(1976776,0,0,'曦萍','外媒账号',1479377398,1479377398,1);

insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values(1977123,0,0,'','外媒账号',1479713466,1479713466,1);
insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values(1977264,0,0,'','外媒账号',1479713466,1479713466,1);
insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values(1977296,0,0,'','外媒账号',1479713466,1479713466,1);
insert `market_account`(`user_id`,`is_admin`,`account_type`,`account_name`,`mark`,`updated_at`,`created_at`,`headimg_type`) values(1978615,0,0,'','外媒账号',1479713466,1479713466,1);


select count(*) FROM (SELECT  DISTINCT(`user_id`) FROM `qeeniao`.`user_has_redpacket` where `user_id` NOT IN  (SELECT DISTINCT(`user_id`)  FROM `qeeniao`.`user_has_redpacket`  where `is_used` = 0 AND `end_time` > 1479720547) )as a;


SELECT w.`user_id` AS '用户ID', u.`real_name` AS '真实姓名', b.`mobile`,  w.`money` AS '提现金额', w.`bank_code` AS '银行卡号', w.`bank_name` AS '银行名称', w.`desc` AS '备注', from_unixtime(w.`ctime`)  as '提现申请时间'
 FROM `wabao_withdraw` w, `jiufu_user` u, `qeeniao_zhiwang`.`zw_user_bank` b 
 WHERE w.`user_id` = u.`user_id` AND w.`bank_code` = b.`bank_acct` AND w.`user_id`  = b.`user_id` 
 AND (
    (w.`ctime`<unix_timemp('2016-12-07 00:00:00') AND w.`autokid` > 27) 
    OR 
    w.`user_id` IN (1874738,1914235,2023336,995643,2012640,196596,2012661,2014927,2014011,212766,2019594));


SELECT w.`user_id` AS '用户ID', u.`real_name` AS '真实姓名', b.`mobile`,  w.`money` AS '提现金额', w.`bank_code` AS '银行卡号', w.`bank_name` AS '银行名称', w.`desc` AS '备注', from_unixtime(w.`ctime`)  as '提现申请时间'
 FROM `qeeniao_jiufu`.`wabao_withdraw` w, `qeeniao_jiufu`.`jiufu_user` u, `qeeniao_zhiwang`.`zw_user_bank` b 
 WHERE w.`user_id` = u.`user_id` AND w.`bank_code` = b.`bank_acct` AND w.`user_id`  = b.`user_id` 
 AND  w.`ctime`<unix_timestamp('2016-12-09 00:00:00') AND w.`ctime`>unix_timestamp('2016-12-08 00:00:00');



INSERT INTO qeeniao.record_type_0(`type_id`, `user_id`, `list_id`, `content`, `income`, `img`, `is_deleted`, `mtime`, `theorder`, `device_key`) (SELECT `type_id`, `user_id`, `list_id`, `content`, `income`, `img`, `is_deleted`, `mtime`, `theorder`, `device_key` FROM qeeniao.record_type where autokid<100000 and user_id < 4000 AND user_id > 0 AND user_id%32=0);






SELECT b.mobilephone, a.* FROM `qeeniao_jiufu`.`wabao_withdraw` a left join `qeeniao_zhiwang`.`zw_user` b on a.`user_id`=b.`user_id` where a.`autokid` >3

UPDATE `qeeniao_sns`.`user_event_count` SET `is_welcome`=1 WHERE `user_id` IN (SELECT `user_id` FROM `qeeniao_sns`.`feed_0` where `producer_user_id`=117440 AND `autokid`<={}0000 AND `autokid`>{}0000 AND `feed_type`=101)












