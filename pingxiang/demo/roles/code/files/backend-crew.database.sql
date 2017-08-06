CREATE DATABASE pingxiang_crew DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use pingxiang_crew;

CREATE TABLE `pcore_user` (
          `user_id` int(10) NOT NULL COMMENT '用户主键id',
          `cellphone` char(11) DEFAULT NULL COMMENT '用户手机号',
          `password` char(32) NOT NULL COMMENT '用户密码',
          `salt` char(4) NOT NULL COMMENT '盐杂质',
          `create_time` int(10) NOT NULL COMMENT '创建时间',
          `update_time` int(10) NOT NULL COMMENT '更新时间',
          `status` tinyint(1) NOT NULL COMMENT '状态(STATUS_NORMAL,0,默认正常状态),(STATUS_DELETE,-2,删除状态)',
          `status_time` int(10) NOT NULL COMMENT '状态更新时间',
          `real_name` varchar(255) NOT NULL COMMENT '真实姓名',
          `user_name` varchar(255) NOT NULL COMMENT '用户名',
          `email` varchar(255) NOT NULL COMMENT '电子邮箱',
          `organization_id` int(10) NOT NULL COMMENT '所属机构id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';


ALTER TABLE `pcore_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `cellphone` (`cellphone`);

ALTER TABLE `pcore_user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户主键id', AUTO_INCREMENT=1;

ALTER TABLE `pcore_user` ADD `avatar` VARCHAR(255) NULL COMMENT '头像' AFTER `organization_id`;

INSERT INTO pcore_user (user_id,cellphone,user_name,real_name,password,salt,email,avatar,organization_id,create_time,update_time,status,status_time) VALUES ('0','18808060165','administrator','杨勋','6c506c682c84e59aba07eff0c319f82d','YKFI','1361600985@qq.com','','1','1501906120','1501906120','0','1501906120');
