# EPEL

EPEL（extra packages for enterprise linux）
--------------------
Fedora小组维护的软件仓库，提供RHEL/CentOS默认不提供的软件包。

安装EPEL，省配置
---------
下载CentOS版本对应的EPEl版本并安装 :`rpm -ivh epel-release*`

直接配置yum源epel,阿里云镜像仓库
-------
`wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo`

自定义仓库，使用阿里云镜像地址`http://mirrors.aliyun.com/centos/`
```
[aliyun_extra]
name=CentOS-$releasever - aliyun_extra
baseurl=http://mirrors.aliyun.com/centos/7/os/x86_64
gpgcheck=0
```
