# 地址解析协议arp(Address Resolution Protocol)

**MAC地址解析，用于将网络层的IP地址解析为数据链路层物理地址MAC地址**<br>
**不能跨网段，只在同一网段使用arp协议**,不同网段，会先通过网关MAC地址，解包转发出去<br>
网络通信中封装数据包括：源主机目标主机的IP地址和MAC地址，ARP用来获取目标IP的MAC地址。<br>
发送ARP协议广播请求，询问目标IP对应的MAC地址，实现IP地址到MAC地址映射，保存到主机或者路由器的ARP表中。<br>

`ip neigh show`<br>
`arp -a`

linux系统修改arp缓存表表项
-----------------

1. /proc/sys/net/ipv4/neigh/default/gc_thresh1 存在于ARP高速缓存中最少层数，如果少于这个数，垃圾收集器将不会修改。缺省值128
2. /proc/sys/net/ipv4/neigh/default/gc_thresh2 保存在ARP高速缓存中的最多记录软限制。垃圾收集器在开始收集前，允许记录数超过这个数字5秒，缺省值是512
3. /proc/sys/net/ipv4/neigh/default/gc_thresh3 保存在ARP高速缓存中的最多记录的硬限制，一旦高速缓存中的数目高于此，垃圾收集器将马上运行。缺省值1024
