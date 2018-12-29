# kube-proxy

**作用**：**服务发现，负载均衡**。可看作Service透明代理（为Pod提供代理）兼负载均衡器（核心功能：将某个Service请求转发到后端的多个Pod实例上）。感知service，pod变化，将变化的信息写入到本地的iptables中。<br>
Service的ClusterIP与NodePort是kube-proxy服务通过iptables的NAT转换实现的。<br>
**kube-proxy运行过程中动态创建与Service相关的iptables规则**，规则实现ClusterIP及NodePort的请求流量重定向到kube-proxy进程对应服务的代理端口的功能。
