# 基本匹配条件

源地址`-s`与目标地址`-d`
-----------
多个逗号隔开：`iptables -t filter -I INPUT -s 192.168.1.111,192.168.1.112 -j DROP`<br>
指定某个网段：`iptables -t filter -I INPUT -s 10.6.0.0/16 -j DROP`<br>
匹配条件取反：`iptables -t filter -A INPUT ! -s 192.168.1.146 -j ACCEPT`<br>

协议类型`-p`
--------
**SSH---tcp协议，ping---icmp协议**<br>
Centos6支持协议：tcp,udp,udplite,icmp,esp,ah,sctp
Centos7支持协议：tcp,udp,udplite,icmp,icmp6,esp,ah,sctp,mh

网卡接口`-i` `-o`
-----------
本机多个网卡时，`-i`匹配报文通过哪块网卡**流入本机**的，只能应用于PREROUTING，INPUT，FORWARD链。`-o`匹配报文从哪块网卡流出本机，与`-i`相反，只能作用于FORWARD、OUTPUT、POSTROUTING链。
