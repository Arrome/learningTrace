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
