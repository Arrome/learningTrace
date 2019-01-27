# 虚拟IP（VIP）
keepalived、heartbeat 临时绑定在物理网卡上的别名<br>
由此VIP对用户提供服务。

别名IP（alias ip）
----------------

辅助IP（secondary IP）
------------

高可用主备服务器切换测试
-------------
1. 停掉主节点上的keepalived服务，然后在BACKUP节点查看是否接管虚拟IP
2. 重新启动主节点上的keepalived服务，看看这时候主节点会不会重新接管VIP，BACKUP节点会不会释放VIP

> **注意**：主备是否通信正常？防火墙是否阻挡？主备两台的keepalived配置文件是否正确？virtual_router_id是否一样？<br>
> **服务器级别，而非服务级别。但通过服务脚本可实现服务高可用**，服务器宕机或keepalived软件故障或连接中断等会故障转移，应用服务故障不会（但通过vrrp_script和vrrp_instance互相绑定，vrrp_script编写服务相关脚本实现服务级高可用）

设置主服务器宕机重启不接管VIP
--------------------
1. 修改M，B服务器的 state BACKUP 都为【备】类型，同时设置 nopreempt 设置为不抢夺VIP，然后先启动M服务器，M服务器会成为【主】
2. 启动B服务器，由于M的优先级高【priority 100】 所以B不会抢夺VIP，这时M宕机，B成为【主】，接着M恢复正常，由于设置了nopreempt 所以M不会抢夺VIP，B继续为【主】而M为【备】。
