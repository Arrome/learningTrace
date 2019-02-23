# net.ipv4

* `net.ipv4.tcp_tw_reuse=1`：参数设置为1,表示允许将TIME-WAIT状态的socket重新用于新的TCP连接
* `net.ipv4.tcp_keepalive_time=600` 这个参数表示当keepalive启动时，TCP发送keepalive消息的频度，默认2小时（参数单位：秒），设置小一些，可更快清理无效连接
* `net.ipv4.tcp_fin_timeout=30` 表示当服务器主动关闭连接时，socket保持在FIN-WAIT-2状态的最大时间
* `net.ipv4.tcp_max_tw_buckets=5000` 表示操作系统允许TIME-WAIT套接字数量的最大值，如果超过这个数字，TIME-WAIT套接字将立即被清除并打印警告信息，默认为180 000,过多的TIME-WAIT套接字会使Web服务器变慢
* `net.ipv4.ip_local_port_range=1024 61000` 定义了在UDP和TCP连接中本地（不包括连接远端）端口取值范围
* `net.ipv4.tcp_rmem=4096 32768 262142` 定义了TCP接收缓存(用于TCP接收滑动窗口)的最小值、默认值、最大值。
* `net.ipv4.tcp_wmem=4096 32768 262142` 定义了TCP发送缓存(用于TCP发送滑动窗口)的最小值、默认值、最大值

* `net.ipv4.tcp_syncookies=1` 解决TCP的SYN攻击
* `net.ipv4.tcp_max_syn.backlog=1024` 表示TCP三次握手建立阶段接收SYN请求队列的最大长度，默认为1024，将其设置的大些可以使出现Nginx繁忙来不及accept新连接的情况时，linux不至于丢失客户端发起的请求连接
