# container IP

calico 网络接口生成的容器的MAC地址都一样，为 `ee:ee:ee:ee:ee:ee`（calico只关心三层IP地址，不关心二层MAC地址）<br>

容器的所有报文都会经过cali0发送到下一跳169.254.1.1（容器路由规则都一样，不需要动态更新，169.254.1.1是预留的本地IP网段）<br>
cali0是veth pair一端，对端是主机caliXXX命名的网络接口（容器中执行`ethtool -S cali0`查看对端网络接口index）<br>

calico开启 ARP_proxy 方式（`cat /proc/sys/net/ipv4/conf/caliXXXXX/proxy_arp`）将网络接口的MAC地址作为容器ARP地址请求结果返回给容器。即后续报文继续发送到主机该网络接口，然后通过IP地址转发。（calico把主机作为容器默认网关，所有报文发到主机，根据主机路由表进行转发）
