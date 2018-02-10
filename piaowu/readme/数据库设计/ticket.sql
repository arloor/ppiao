CREATE TABLE maipiaopiao.ticket
(
    ticketname varchar(20) PRIMARY KEY NOT NULL COMMENT '优惠券名',
    type int(11) DEFAULT '0' COMMENT '优惠券类型：根据此值确定param,,的含义',
    param0 varchar(10),
    param1 varchar(10),
    param2 varchar(10),
    `left` int(11) COMMENT '剩余数量'
);