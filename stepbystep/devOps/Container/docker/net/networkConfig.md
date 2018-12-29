#网络配置

Docker服务启动时配置
------------------

* `--dns=IP_ADDRESS` 指定DNS服务器，默认和宿主一样
* `--dns-search=DOMAIN` 指定DNS搜索域，默认和宿主一样

Docker容器启动时配置(docker run)
------------------

* `-h HOSTNAME(--hostname=HOSTNAME)` 配置容器主机名(添加到容器/etc/hostname和/etc/hosts)
* `--link=CONTAINER_NAME`(自动分配容器名或--name指定名，不能为-h主机名):ALIAS 添加到另一个容器的连接(添加到容器/etc/hosts)
* `--net=bridge|none|container:NAME_or_ID|host` 配置容器桥接模式
  * `--net=bridge` 默认值，在Docker网桥上为容器创建新的网络栈
  * `--net=host` Docker不将容器网络放到隔离的命名空间中。(容器使用本地主机网络，拥有完全的本地主机接口访问权限。容器进程可以跟主机其他root进程一样打开低范围的端口，可以访问本地网络服务，如D-bus，还可以让容器影响整个主机系统的事情，如重启主机。进一步使用`--privileged=true`容器甚至会被允许直接配置主机网络堆栈)
  * `--net=container` 新建容器的进程放到一个已存在容器的网络堆栈。新容器进程有自己的文件系统、进程列表、资源限制，但会和已存在的容器共享IP地址和端口等网络资源。两者进程可直接通过lo换回接口通信
  * `--net=none` 将新容器放到隔离的网络栈中，但不进行网络配置。之后，用户可以自己进行配置
* `-p SPEC(--publish=SPEC)` 映射容器端口到宿主机
* `-P(--publish-all=true|false)` 映射容器所有端口到宿主机

* `--dns=IP_ADDRESS` 指定DNS服务器，默认和宿主一样(添加到容器/etc/resolv.conf，容器会用指定服务器解析不在/etc/hosts中的主机)
* `--dns-search=DOMAIN` 指定DNS搜索域，默认和宿主一样(当设定搜索域为.example.com,在搜索一个名为host的主机时，DNS不仅搜索host，还会搜索host.example.com)

Docker的DNS和主机的配置文件
------------------------

|文件|默认配置|作用|
|---|-------|---|
|/etc/resolv.conf|默认和宿主机内容一致|。。。|
|/etc/hosts|默认只记录容器自身的一些地址名称|。。。|
|/etc/hostname|。。。|记录容器主机名|
