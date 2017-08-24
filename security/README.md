# security 剧本介绍

---

主要用于执行一些部署服务器前期的配置工作

### sshd_config.yml

* 创建`sshallow`用户组
* 添加`ansible`用户附加组`sshallow`
* 更新`/etc/ssh/sshd_config`配置文件.

	* 用于修改`ssh`端口.
	* 禁用`root`账户远程登录.
	* 设定只有`AllowGroups`组的用户可以`ssh`

### disable_ping.yml

* 服务器禁ping

### tmout.yml

* 设定`linux`系统的空闲等待时间
	* 复制`tmout.sh`脚本到`/etc/profile.d`下
	* 设定`TMOUT`值
	* 设定`TMOUT`为`readonly`

