# host模式

![主机网络模式](../../images/host.jpg)

如果启动容器时使用host模式，容器将不会获得一个独立的Network Namespace，而是**和宿主机公用一个network namespace**。**容器不会虚拟出自己的网卡，而是使用宿主机的IP和端口。**容器其他方面依然是隔离的（如文件系统、进程列表等）<br>
外部通过宿主机**IP和端口**访问容器
