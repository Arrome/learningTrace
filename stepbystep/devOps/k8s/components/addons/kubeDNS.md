# kubeDNS


# coredns 模块化可插拔DNS服务器
configmap 配置 corefile，更改服务发现的工作方式

# k8s 中 pod 的DNS策略（spec.dnsPolicy）：
1. Default : pod继承所在主机的DNS配置
2. ClusterFirst : k8s默认配置，先在k8s集群配置的coredns中查询，查不到继承主机上nameserver中查询
3. ClusterFirstWithHostNet : 对网络配置为hostNetwork的pod，dns配置规则于cluseterFirst一致
4. None : 忽略k8s环境dns配置，只认pod配置的dnsConfig设置

# DNS 解析过程
pod部署时，使用k8s集群DNS，kubelet起pause容器时，会将DNS解析配置初始化成集群内配置/etc/resolv.conf
（pod spec.dnsConfig可以配置/etc/resolv.conf）
1. nameserver dns服务器地址
2. search 搜索域，访问域名依次带入搜索域查找。
3. options dnots 查询域名点小于5，先走search域，再用绝对域名，反正。

# pod 配置hosts resolv.conf
* spec.dnsConfig可以配置/etc/resolv.conf
* spec.hostname  未配置则默认使用metadata.name
  spec.subdomain service的name