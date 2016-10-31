#dev 剧本介绍

---

主要用于开发人员电脑环境部署,可以根据不同人员的角色来划分`roles`.

* `php`: php 开发人员role

###PHP

####通用(common)

* 更新软件包 yum upgrade
* 安装软件包
	* `git`
	* `docker`
* 开机启动`docker`服务
* 添加`docker`用户组
* `ansible`用户加入`docker`用户组,方便ansible用户操作docker
* 复制`docker-compose`编排工具
* 修改`docker`的配置文件`/etc/sysconfig/docker/`
* 关闭`selinux`
* 开启服务
	* `docker`
	
####php(暂时未使用到该剧本)

**修改`/etc/hosts`**

* 修改`/etc/hosts`,添加本机地址`127.0.0.1`指向我们微服务`域名`

**更新代码**

* 创建代码文件夹
* 从`git`更新代码
* 更新配置(`放弃`),改用`confd`从`etcd`更新配置

**更新钩子**

* 代码库的`pre-commit`更新入`.git/hooks`文件
* 以后其他钩子,也在这里更新

**更新`docker-compose`环境编排文件**

`废弃`,`docker-compose.yml`的编排文件从代码库更新

**启动环境**

* 根据`docker-compose.yml`启动环境

**创建数据**

创建默认数据,未开发

###后续修改

####微服务

因为根据微服务不同,所以代码需要根据不同的服务划分不同的角色(`roles`)更新.

####前端自动化工具

根据前端需求更新前端自动化工具.