# yum

yum源配置（/etc/repos.d）
----------
* CentOS-Base.repo   网络更新默认首选
* CentOS-CR.repo
* CentOS-Debuginfo.repo
* CentOS-fasttrack.repo
* CentOS-Media.repo
* CentOS-Sources.repo
* CentOS-Vault.repo

EPEL（extra packages for enterprise linux）
--------------------
Fedora小组维护的软件仓库，提供RHEL/CentOS默认不提供的软件包。

安装EPEL，省配置
---------
下载CentOS版本对应的EPEl版本并安装 :`rpm -ivh epel-release*`

直接配置yum源epel
-------
`wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo`
1. yum配置文件:/etc/yum.conf
2. yum源：/etc/yum.repos.d

配置本地yum源，无外网情况下
---------------------
**httpd构建本地镜像站**：

> `yum repolist` 查看yum源

卸载yum安装的软件
--------------
`yum remove <package_name>`

工具包组
----------
`yum grouplist`<br>
`yum groupinstall "Development Tools"`

yum升级
-------
`yum -y update` 升级软件包和系统内核
`yum -y upgrade` 只升级软件包

yumdownload工具
--------------


> 清除缓存（yum配置后最好执行一下，可能找不到）：`yum clean all`<br>
  yum源缓存到本地，加快软件搜索安装：`yum makecache`

Problems:
---------
1. 问题：yum [Errno -1] 软件包与预期下载的不符 <br>
  网上方法未解决：
```
rm -f /var/lib/rpm/__*
rpm --rebuilddb -v -v

yum clean dbcache
yum clean metadata
yum clean rpmdb
yum clean headers
yum clean all

rm -rf /var/cache/yum/timedhosts.txt
rm -rf /var/cache/yum/*

yum makecache
```
