# 网络配置文件

* /etc/hosts : 存储主机名和IP地址映射，用来解析无法用其他方式解析的主机名
* /etc/resolv.conf : 与域名解析有关的设置
* /etc/sysconfig/network : 定义**所有网络接口的路由和主机信息**
* /etc/sysconfig/network-scripts/ifcfg-<网络接口名>：对于每个网络接口都有一个对应的接口配置文件，提供该网络接口的特定信息。
