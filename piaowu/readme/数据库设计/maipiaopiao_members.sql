CREATE TABLE maipiaopiao.members
(
    email varchar(20) COMMENT '会员邮箱（不可更改）',
    uname varchar(20) PRIMARY KEY NOT NULL COMMENT '会员名（使用英文+数字，不可更改）',
    passwd varchar(20) COMMENT '使用mysql加密的用户密码',
    role varchar(25) DEFAULT 'ROLE_MEMBER',
    paykey varchar(20) COMMENT '支付密码',
    balance int(11) DEFAULT '0' COMMENT '用户余额，整数',
    bonus int(11) DEFAULT '0' COMMENT '会员积分',
    paynum int(11) DEFAULT '0' COMMENT '消费总金额，决定会员等级',
    timesign timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '注册时间',
    timecancel timestamp COMMENT '注销时间，如果为null，说明账号有效',
    pin varchar(6) COMMENT '各种用途的验证码',
    pinindex int(11) DEFAULT '0' COMMENT '验证码序号，用于确定验证码是否失效'
);
CREATE UNIQUE INDEX members_email_uindex ON maipiaopiao.members (email);
INSERT INTO maipiaopiao.members (email, uname, passwd, role, paykey, balance, bonus, paynum, timesign, timecancel, pin, pinindex) VALUES ('1293181335@qq.com', 'arloor', 'arloor', 'ROLE_MEMBER', '123456', 100, 100, 1234, '2018-02-02 05:29:47', null, '54306', 69);
