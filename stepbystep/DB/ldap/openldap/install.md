# 安装


软件包套件
------
* openldap 服务端客户端必须用的库文件
* openldap-clients 在服务端上使用，查看修改目录的命令行包
* openldap-servers 启动服务和设置
* openldap-servers-sql 支持sql模块
* compat-openldap 兼容性库

yum安装
-------
1. `yum -y install openldap openldap-*`
2. `rpm -qa|grep openldap-*` 验证是否安装完成

```
# rpm -qa | grep openldap
openldap-servers-sql-2.4.44-21.el7_6.x86_64
openldap-2.4.44-21.el7_6.x86_64
openldap-servers-2.4.44-21.el7_6.x86_64
openldap-devel-2.4.44-21.el7_6.x86_64
openldap-clients-2.4.44-21.el7_6.x86_64
```

源码安装
------



Problems
-------
* 问题：`tlsmc_cert_create_hash_symlink: ERROR: OS error: Permission denied`<br>
  解决：关闭selinux
