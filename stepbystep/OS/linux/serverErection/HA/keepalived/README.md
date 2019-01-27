# keepalived

**开发语言**：ANSI/ISO C

**主要提供功能**：
1. 负载均衡：依赖Linux 虚拟服务内核模块(ipvs)
2. 高可用功能：通过VRRP协议(虚拟路由冗余协议Virtual Redundancy Routing Protocol)实现多台机器间故障转移服务

**keepalived软件设计**：
![keepalived软件设计](../../img/keepalived_software_design.png)

**依赖linux的四个内核组件**：
1. **LVS Framework**: Uses the getsockopt and setsockopt calls to get and set options on sockets.
2. **Netfilter Framework**: IPVS code that supports NAT and Masquerading.
3. **Netlink Interface**: Sets and removes VRRP virtual IPs on network interfaces.
4. **Multicast**: VRRP advertisements are sent to the reserved VRRP MULTICAST group (224.0.0.18).


防止脑裂
-------
Fencing and Stonith
