# SELinux(Security-Enhanced Linux)

安全增强型 Linux简称 SELinux，它是一个 Linux 内核模块，也是 Linux 的一个安全子系统<br>

> ubuntu 系统中默认没有，需要安装 selinux-utils 工具

**主要作用**：<br>
最大限度地减小系统中服务进程可访问的资源<br>

**三种状态**：<br>
1. enforcing : 强制，每个受限的进程都必须受限
2. permissive ： 允许，每个受限的进程违规操作不会被禁止，但会被记录于审计日志
3. disabled ： 禁用

相关命令
--------
####SELinux状态设置
* getenforce 获取当前状态
* sestatus   查看selinux状态
* setenforce 设置selinux状态(0:permissive;1:enforcing)
  * 或者修改 /etc/selinux/config 文件
> 仅限制在selinux开启状态下切换，如果设置为 disabled 改为其他两个状态，需要重启后生效
