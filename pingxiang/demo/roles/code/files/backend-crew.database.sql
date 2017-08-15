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

insert into `pcore_user`(`user_id`,`cellphone`,`password`,`salt`,`create_time`,`update_time`,`status`,`status_time`,`real_name`,`user_name`,`email`,`organization_id`,`avatar`) values
('74','15191887088','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501905251','1501905251','0','1501905251','政府金融','zfjrb','1361500925@qq.com','13',null),
('73','15191887078','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501905183','1501905183','0','1501905183','人力社保','rlsbj','1361500935@qq.com','2',null),
('67','15191887068','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501905018','1501905018','0','1501905018','国资委','gzw','1361500945@qq.com','20',null),
('66','15191887058','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501904908','1501904908','0','1502011532','国土资源','gtzy','1361500955@qq.com','3',null),
('65','15191887048','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501904834','1502011717','0','1501904834','国税局','gsj','1361500965@qq.com','8',''),
('64','15191887028','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501904734','1501904734','0','1502011777','发改委','fgw','1361500975@qq.com','1',null),
('2','18729358585','9acebf99215085a5ea0c2e5e62f12199','HXlq','1501231018','1501558121','0','1501919528','管理员','admin','123456789@qq.com','1',null);
