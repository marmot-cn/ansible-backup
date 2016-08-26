# ansible

----

###目录

* dev : 开发主机部署,程序自己电脑集体部署剧本
* k8s : 测试和生产的k8s部署剧本
* repository : docker 私有仓库部署剧本,现在暂时使用阿里云的私有仓库.暂不使用.

###使用前要准备的工作

####创建目标主机用户 ansible

当我们创建了一台新的服务器时候,我们需要做如下操作.这里的操作我没有放到剧本里是因为在是用 root 和 密码登陆时候ansible链接会报异常.而且为了安全考虑如下操作还是换成人工处理方式.等以后ansible使用熟练在考虑替换的部分.

**创建用户**

		[root@iZ94xwu3is8Z ~]# useradd ansible
		[root@iZ94xwu3is8Z ~]# passwd ansible
		更改用户 ansible 的密码 。
		新的 密码：
		重新输入新的 密码：
		passwd：所有的身份验证令牌已经成功更新。
		
**用户添加入wheel组,使其可以免密码sudo**

		[root@iZ94xwu3is8Z ~]# usermod -aG wheel  ansible
		[root@iZ94xwu3is8Z ~]# id ansible
		uid=1000(ansible) gid=1000(ansible) 组=1000(ansible),10(wheel)

**给予用户root权限**

修改`/etc/sudoers`.我们修改权限才能修改该文件.

		chmod 755 /etc/sudoers
		
取消该行注释,并注释掉上面的一行.
		
		# %wheel        ALL=(ALL)       ALL
		%wheel  ALL=(ALL)       NOPASSWD: ALL

还原权限:

		[root@iZ94xwu3is8Z ~]# chmod 440 /etc/sudoers
		[root@iZ94xwu3is8Z ~]# ll -s /etc/sudoers
		4 -r--r----- 1 root root 4000 6月   3 13:59 /etc/sudoers

####ansible免登陆

		cat ~/.ssh/id_rsa.pub | ssh ansible@120.24.3.210 "umask 077; mkdir -p .ssh ; cat >> .ssh/authorized_keys"

####`/etc/sudoers`

**给予`ansible`root权限**

方便我们后续基本的操作.

####执行security剧本

更改我们的登陆端口,以及禁止root登陆的操作

		ansible-playbook security.yml

###常用操作

**从组中筛选主机**

我们从test组筛选出 minon1 主机

		ansible test --limit minon1 -m ping
		

###剧本

####dev

主要用于部署我们的开发电脑,详细见An [dev play book](./doc/dev.md "dev play book")
