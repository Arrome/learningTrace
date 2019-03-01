# NAT（network address translation）

一种把内部私有网络IP地址翻译成合法网络IP地址技术（比如在网关将内部地址替换为公用地址），解决公网地址不足问题。<br>
**工作原理**：当私有网络主机和公共网络主机通信IP包通过NAT网关时，将IP包中的源IP或目的IP在私有IP和NAT公共IP之间进行转换。<br>
通常被集成到路由器、防火墙、ISDN路由器或单独NAT设备中<br>

**分类**：静态NAT（static NAT）、动态NAT（pooled NAT）、网络地址端口转换NAPT（port-level NAT）

* SNAT(source network address translation)源地址目标转换：配置固定的IP地址
* DNAT（destination network address translation）目标网络地址转换
* MASQUERADE 地址伪装（SNAT特例，在iptables中和SNAT效果相近）：**从服务器网卡上，自动获取当前IP地址**来做SNAT，计算机负荷稍微多些，对每个匹配的包，其都要查找可用的IP地址
