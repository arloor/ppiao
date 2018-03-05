CREATE TABLE maipiaopiao.seatarrange
(
    seatarrangeid int(11) NOT NULL,
    seatindex int(11) NOT NULL,
    part varchar(20) COMMENT '座位类型（一等、二等、）（a去，b区）',
    row int(11),
    colum int(11),
    CONSTRAINT `PRIMARY` PRIMARY KEY (seatindex, seatarrangeid)
);