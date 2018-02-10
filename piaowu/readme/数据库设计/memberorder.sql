CREATE TABLE maipiaopiao.memberorder
(
    uname varchar(20),
    placeid int(11) COMMENT '场馆id',
    eventid int(11) COMMENT '活动id',
    state varchar(20) COMMENT 'weizhifu、yizhifu、quxiao、wancheng',
    seatnum int(11) COMMENT '订票的座位数量',
    seatarrange int(11) COMMENT '座位安排id',
    booktime timestamp DEFAULT CURRENT_TIMESTAMP,
    charge int(11),
    pay int(11),
    ticketid int(11) COMMENT '使用的优惠券'
);