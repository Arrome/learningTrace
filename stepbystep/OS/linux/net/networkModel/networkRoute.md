# 网络路由

**使用场景**：linux服务器配置多个网络接口，同时连接多个不同子网，就需要为网络接口配置路由。也可将linux配置为软件路由，以替代硬件路由器设备。<br>
如果主机在路由表中没有找到目标主机IP或者网络路由，则使用默认路由。默认路由简化了主机的配置。默认路由的网络地址和网络掩码均为0.0.0.0。在TCP/IP协议配置中，一般将默认路由称为默认网关<br>

路由转发功能ip_forward
----------
**默认情况下，linux内核不支持IP数据包转发，各个网络接口间不能转发数据包，需要启用IP转发功能(当主机拥有多于一块网卡时，其中一块收到数据包，根据数据包的目的IP地址将数据包发往本机另一块网卡，该网卡根据路由表继续发送数据包)**`sysctl -w net.ipv4.ip_forward=1`(暂时生效)，修改配置文件/etc/sysctl.conf文件`net.ipv4.ip_forward=1`并执行`sysctl -p /etc/sysctl.conf`使其生效

静态路由
--------
**适用场景**：路由拓扑结构少有变化的小型网络环境，需要安全度高的

动态路由
-----------
通过路由协议在路由器间互相交换路由信息，自动生成路由表，并根据实际情况动态调整和维护路由表。

路由协议
-------
跟踪路由网络环境中所有网络拓扑结构，动态维护网络中与其他路由器相关的信息，依此预测可能最优路由。
* 边界网关协议（Border GateWay Protocol,BGP）
* 增强的内部网关路由协议（Enhanced Interior Gateway Routing Protocol,EIGRP）
* 外部网关协议（Exterior Gateway Protocol,EGP）
* 内部网关路由协议（Interior Gateway Routing Protocol,IGRP）
* 开放最短路径优先（Open Shortest Path First,OSPF）
* 路由信息协议（Routing Information Protocol,RIP）
