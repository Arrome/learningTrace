# 系统网络

`/etc/sysconfig/network-scripts/`

* `net.bridge.bridge-nf-call-iptables＝1` 意味着二层的网桥在转发包时也会被iptables的FORWARD规则所过滤，这样就会出现L3层的iptables rules去过滤L2的帧的问题`
