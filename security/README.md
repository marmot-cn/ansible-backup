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

### pam.yml

#### 登录尝试失败后锁定用户

* `pam/password-auth.yml`
* `pam/system-auth.yml`

参考官方文档`https://access.redhat.com/documentation/zh-CN/Red_Hat_Enterprise_Linux/7/html/Security_Guide/chap-Hardening_Your_System_with_Tools_and_Services.html#sec-Locking_User_Accounts_After_Failed_Login_Attempts`

* 程序先判定是否存在`pam_faillock.so`,如果不存在直接写入, 否则更新.
* 根据官方文档, 需要修改`/etc/pam.d/system-auth`文件和`/etc/pam.d/password-auth`文件中的`auth`区段
* 设定用户登录错误的尝试次数,`pam_faillock.so`(`https://linux.die.net/man/8/pam_faillock`)
	* 在登录前触发`preauth`
	* 不提示任何信息`silent`
	* 几次失败后触发`deny=n`
	* 多长时间内失败次数判定`fail_interval=n`
	* 解锁时间`unlock_time=n`
	* 对`root`用户也做类似判定`even_deny_root`
	* `root`用户失败后的解锁时间

要查看每个用户的尝试失败次数，则须作为 root 用户运行以下命令行：

```shell
[ansible@iZ94ebqp9jtZ ~]$ sudo faillock
ansible:
When                Type  Source                                           Valid
root:
When                Type  Source                                           Valid
tom:
When                Type  Source                                           Valid
2017-08-30 02:03:34 TTY   pts/0                                                V
2017-08-30 02:03:39 TTY   pts/0                                                V
2017-08-30 02:03:44 TTY   pts/0                                                V
```

要解锁一个用户的账户，则须作为 root 用户运行以下命令行：

```shell
faillock --user <username> --reset
```

#### 更新用户密码过期时间

chage -l  root