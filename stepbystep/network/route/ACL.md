# ACL访问控制列表

应用：在路由器接口的指令列表(规则)，告诉路由器允许和拒绝哪些数据出入<br>
原理：ACL使用流量控制(过滤)技术，**在路由器上读取网络层和传输层的报头信息(源IP 目标IP 源端口 目标端口)，通过执行ACL定义的访问规则，进行数据流量控制和过滤，达到网络访问控制目的。**当一个ACL有多个rule，按照RULE编号执行，若冲突，标号小的rule命令有效（华为设备默认允许所有ACL条目，思科拒绝所有，虚拟接口/NAT模式下默认拒绝所有）
