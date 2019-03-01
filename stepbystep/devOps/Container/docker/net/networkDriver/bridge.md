# 网桥驱动

![网桥模式](../../images/bridge.jpg)

|User-defined bridge|Default bridge|
|-------------------|--------------|
|连接到自定义网桥上的容器互相自动的暴露所有端口，而没有对外端口暴露|需要-p或--publish暴露端口|
|容器能通过名字或者别名互相访问|除非用--link选项，或者配置/etc/hosts（不方便debug），否则容器只能通过IP地址访问|
|容器生命周期内可以连接断开自定义网络|需要停止容器重新创建一个新的网络选项|
|根据应用程序组的不同网络需求，单独配置网桥|可以配置，但所有容器都使用相同设置（如：MTU，iptables规则），配置默认网桥需要重启Docker|
|共享环境变量通过1.挂载卷2.docker-compose文件指定3.swarm服务|共享变量通过--link选项|
|可以启用禁止IPv6|不能禁止IPv6|
||通过daemon.json可以配置默认网桥|

启用转发，容器连接外界
------------------
1. `sysctl net.ipv4.conf.all.forwarding=1`配置linux内核允许IP转发
2. `sudo iptables -P FORWARD ACCEPT`改变iptables FORWARD策略DROP为ACCEPT


访问过程
---------
* 外界访问容器
  1. 外界访问宿主机IP+port
  2. 宿主机接收请求后，由DNAT规则，将请求的目的IP和port进行转换，转换为容器IP+port
  3. 请求发送给veth pair，发送到容器eth0
  iptables-save命令查看：`-A DOCKER ! -i docker0 -p tcp -m tcp --dport 3307 -j DNAT --to-destination 172.17.0.2:3306`
* 容器访问外界
  1. IP包首先从容器发往自己的默认网关docker0，包到达docker0后，然后查询主机路由表arp，发现包应该从主机eth0发出<br>  
  2. 接着包会转发给eth0，并从eth0发出。根据iptables规则，对包做SNAT转换，源地址替换为eth0地址<br>
    iptables-save命令查看：`-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE`
