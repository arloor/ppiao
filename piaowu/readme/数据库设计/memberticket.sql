CREATE TABLE maipiaopiao.memberticket
(
    ticketid int(11) PRIMARY KEY NOT NULL COMMENT '用户拥有的券的表示' AUTO_INCREMENT,
    uname varchar(20),
    ticketname varchar(20),
    used int(11) COMMENT '0未使用',
    gettime timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    usetime timestamp DEFAULT '0000-00-00 00:00:00' NOT NULL
);