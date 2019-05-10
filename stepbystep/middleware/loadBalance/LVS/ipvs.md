# ipvs(ip virtual server)

可以将基于TCP和UDP的服务请求转发到真实服务器上，并使真实服务器的服务在单个IP地址上显示为虚拟服务。<br>
内核空间代码，真正实现调度的代码。<br>
IPVS依赖iptables，进行包过滤、SNAT、masquared。（ipvs使用ipset来存储需要DROP或masquared的流量的源或者目标地址，以确保iptables规则的数量恒定）<br>
