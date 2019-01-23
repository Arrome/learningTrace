# 进程工具

![zabbix架构](../../img/zabbix_arch.png)

* zabbix_server : 服务端守护进程，负责处理客户端主动送来及其主动取回的数据，通过web界面呈现
* zabbix_agentd ：客户端守护进程，负责收集客户端上数据并发送给server或proxy
* zabbix_proxy  : 类似server，作为中转站，当跨地区，跨机房监控时，收集数据发送到server
* zabbix_java_gateway : 类似agentd，只用于java应用程序监控（只能主动获取数据，agent active）

* zabbix_get 服务端工具，用于手动收集客户端监控数据，可用于监控测试或排错
* zabbix_sender 客户端工具，对于非常耗时的检测项，可在其检测完成后，通过它将数据发送到server或proxy。需配合trapper使用

* zabbix_web 构建zabbix专用站点，将监控数据以web页面形式展现出来
