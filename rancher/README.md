#Rancher

----

ansible rancher 部署代码,我们在剧本中区分如下角色:

* common 通用角色
* agent agent 节点部署
* server server 节点部署

###common

* 修改主机名称
* 更新主机软件包
* 更新selinux
* 格式化数据盘
	* 硬盘分区
	* 格式化硬盘(数据盘)
	* 挂在数据盘到`/data`
* 格式化lvm磁盘
	* 硬盘分区 lvm
	* 检查分区是否已经创建,如果分区已经创建
		* 创建 pv
		* 创建 vg
		* 创建 lvm:thinpool
		* 创建 lvm:thinpoolmeta
		* 转换 lvm:thinpool to thinpool 和 lvm:thinpoolmeta to poolmetadata
		* 更新 docker-thinpool.profile 配置文件,使用精简池
		* 更新 lv配置
* 创建交换分区
	* 创建存储交换分区文件的文件夹
	* 创建交换分区文件
	* 检查交换分区文件是否存在,如果存在
		* 创建交换分区文件
		* 启动交换分区文件
		* 挂载交换分区文件
* 安装docker 
	* 安装`1.10.3`docker
	* 开机启动docker服务
	* 复制配置docker配置文件
	* 复制docker配置文件使用精简池
	* 重新启动docker
	* 创建docker用户组
	* 把ansible用户添加入docker用户组

###server

下载`rancher/server`镜像,这里我们手动启动镜像,不适用自动启动,因为可能需要使用数据库存储
		
		sudo docker run -d --restart=unless-stopped -p 8080:8080 -e CATTLE_DB_CATTLE_MYSQL_HOST=阿里云数据库地址 -e CATTLE_DB_CATTLE_MYSQL_PORT=数据库端口号 -e CATTLE_DB_CATTLE_MYSQL_NAME=数据库名称 -e CATTLE_DB_CATTLE_USERNAME=数据库用户名 -e CATTLE_DB_CATTLE_PASSWORD=数据库密码 rancher/server

建议生产环境使用数据库存储方案,使用之前请先创建数据库和授权用户.

###agent

* 安装 httplib2, 用于获取server端的信息
* 从server端获取默认项目id,这里主要是用于创建agent节点使用
* 获取注册token的url从server节点
* 获取rancher server的注册token url获取注册 token
* 下载 agent 镜像
* 检测 agent 是否已经启动,如果没有启动:
	* 启动 agent 容器