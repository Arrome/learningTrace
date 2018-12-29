# host模式

如果启动容器时使用host模式，容器将不会获得一个独立的Network Namespace，而是**和宿主机公用一个network namespace**。**容器不会虚拟出自己的网卡，而是使用宿主机的IP和端口。**
