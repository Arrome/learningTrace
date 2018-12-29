# apt包管理工具
=======================
默认的下载源访问下载会很慢，配置国内镜像仓库加速

1.配置下载源
--------------
阿里开源 源包下载地址：https://opsx.alibaba.com/

    重写在/etc/apt目录下的sources.list文件
    配置aliyun仓库（ubuntu）

```
deb https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
```

默认安装位置
----------

|路径|说明|
|----|----|
|/var/cache/apt/archives|下载的软件存放位置|
|/usr/share|安装后软件默认位置|
|/usr/bin|可执行文件位置|
|/etc|配置文件位置|
|/usr/lib|lib 文件位置|
