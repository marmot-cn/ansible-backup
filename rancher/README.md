# rancher

----

ansible rancher 部署代码,我们在剧本中区分如下角色:

* common 通用角色
* agent agent 节点部署
* server server 节点部署

## common

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

## server

下载`rancher/server`镜像,这里我们手动启动镜像,不适用自动启动,因为可能需要使用数据库存储
		
		sudo docker run -d --restart=unless-stopped -p 8080:8080 -e CATTLE_DB_CATTLE_MYSQL_HOST=阿里云数据库地址 -e CATTLE_DB_CATTLE_MYSQL_PORT=数据库端口号 -e CATTLE_DB_CATTLE_MYSQL_NAME=数据库名称 -e CATTLE_DB_CATTLE_USERNAME=数据库用户名 -e CATTLE_DB_CATTLE_PASSWORD=数据库密码 rancher/server

建议生产环境使用数据库存储方案,使用之前请先创建数据库和授权用户.

## agent

* 安装 httplib2, 用于获取server端的信息
* 从server端获取默认项目id,这里主要是用于创建agent节点使用
* 获取注册token的url从server节点
* 获取rancher server的注册token url获取注册 token
* 下载 agent 镜像
* 检测 agent 是否已经启动,如果没有启动:
	* 启动 agent 容器

---

## 更新记录

### 1.1

在`common`任务中添加`ctop`容器数据监控工具

只在工作节点部署:

		ansible-playbook deploy-agent.yml -i xxx.hosts --tags="ctop"
		
### 1.2

#### 安装`lvm2`

因为默认阿里云`centos 7`没有`lvm2`软件, 安装`lvm2`软件. 且保证为最新版. 因为旧版使用`lvchange`命令没有`--metadataprofile`选项.

#### 安装`docker-1.10.3`

安装`docker-1.10.3`版本

#### 删除多余的`docker`配置文件

删除以前旧的无用的`docker`配置文件.

#### 取消更新所有包的任务

在`common`任务中取消更新所有包的执行任务 `upgrade all packages`.

#### sysctl.conf

在`common`任务添加对`/etc/sysctl.conf`配置文件修改, 修改

* `net.netfilter.nf_conntrack_max`
* `net.netfilter.nf_conntrack_tcp_timeout_established`
* `net.netfilter.nf_conntrack_tcp_timeout_close_wait`
* `net.netfilter.nf_conntrack_tcp_timeout_fin_wait`
* `net.netfilter.nf_conntrack_tcp_timeout_time_wait`

`net.netfilter.nf_conntrack_max`值计算方法`CONNTRACK_MAX = RAMSIZE (in bytes) / 16384 / (ARCH / 32)`.

我们生产服务器为`8G`, 按照`4G`空余使用计算:

`4*1024*1024*1024/16384/2 = 131072`.

* `1024*1024*1024` = `1G`
* `ARCH / 32` = `64 /32` = `2`

### 1.3

#### 更新`dokcer`版本升级到`ce`

更新到`17.06.x-ce`, 因为`rancher`暂时只支持到该版本.

目前最新稳定版是`17.06.2.ce--1.el7.centos`

`yum install docker-ce-17.06.2.ce`

### 废弃更新

1. 把`docker`转移到单独的部署文件夹.
2. `rancher`的`master`和`agent`节点都手动部署.不使用`ansible`部署.
3. 后期想考虑到把`rancher`逐步过多到`k8s`.