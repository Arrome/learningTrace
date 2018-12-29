# Calico

**语言**：Python<br>
**原理**：**把Host当作路由器(容器IP新增到宿主机路由表中，作为主机路由)，使用BGP同步路由，并使用iptables做安全访问策略**<br>
（借鉴思路：路由器作为网关连接子网络，之间通过BGP互相学习，并使用防火墙控制不同子网间安全策略）<br>

基于BGP协议(Border GateWay Protocol,边界网络协议) 的纯三层虚拟网络方案<br>
利用**linux内核原生的route和iptables防火墙功能**（**原理**：通过修改每个主机节点上的iptables和路由表规则，实现容器间数据路由和访问控制，并通过Etcd协调节点配置信息）<br>
Calico 不需要对数据包做额外封装，不需要NAT和端口映射。

**优势**：
1. 平行式扩展，可扩展性强
2. 容器间三层隔离，无需担心ARP风暴
3. 基于iptable/linux kernel包转发效率高，损耗低

**劣势**：
1. 仅支持TCP、UDP、ICMP、ICMPv6协议
2. 没有加密数据路径

组件
----
1. calico/node:(Felix,BIRD,confd)
2. cni插件：(calico,calico-ipam,loopback)
3. etcd
4. calico/kube-policy-controller
