# net.core

* `net.core.netdev_max_backlog=8096`当网卡接收数据包的速度大于内核处理的速度时,会有一个队列保存这些数据包。这个参数表示该队列的最大值
* `net.core.rmem_default=262144` 表示内核套接字接收缓存区默认的大小
* `net.core.wmem_default=262144`表示内核套接字发送缓存区默认的大小
* `net.core.rmem_max=2097152` 表示内核套接字接收缓存区的最大大小。
* `net.core.wmem_max=2097152`表示内核套接字发送缓存区的最大大小。
