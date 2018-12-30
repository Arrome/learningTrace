# kubelet

**作用**：
1. 处理master节点下发到本节点的任务，管理Pod及Pod中的容器<br>
2. 启动时通过API Server注册自身的节点信息，并定时向API Server汇报状态信息，API Server收到信息后，将信息更新到etcd中。通过cAdvisor监控容器和节点资源<br>

etcd中存储的节点信息包括：节点健康状况、节点资源、节点名称、节点地址信息、操作系统版本、Docker版本、kubelet版本等。<br>

节点上的kubelet通过API Server监听到kube-scheduler产生Pod绑定事件后，获取对应的Pod清单，下载Image镜像，并启动容器<br>

kubeconfig配置
-----------



kubelet 启动参数
-------------
kubeconfig相关参数：
* `--kubeconfig=/var/lib/kubelet/kubeconfig` kubeconfig 文件的路径，用来指定如何连接到 API server
* `--require-kubeconfig`  设置为 true, kubelet 将在配置错误时退出并忽略

系统Pod相关参数：
-----------
* `--pod-manifest-path=/etc/kubernetes/manifests`
* `--allow-privileged=true`  如果为 true ，将允许容器请求特权模式

network相关参数：
* `--network-plugin=cni`  在 kubelet/pod 生命周期中为各种事件调用的网络插件的名称
* `--cni-conf-dir=/etc/cni/net.d`  CNI插件配置文件的完整路径
* `--cni-bin-dir=/opt/cni/bin`     CNI插件二进制文件的完整路径

DNS相关参数
---------
* `--cluster-dns` DNS 服务器的IP地址列表，逗号分隔。这个值是用于配置指定了“dnsPolicy=ClusterFirst”的容器 DNS 服务器
* `--cluster-domain` 集群域名, kubelet 将配置所有容器除了主机搜索域还将搜索当前域。

认证相关参数
----------
* `--authorization-mode=Webhook`  kubelet 服务的授权模式。有效的选项是 AlwaysAllow 或 Webhook 。Webhook 模式使用 SubjectAccessReview API 来确定授权。(默认“AlwaysAllow”)
* `--client-ca-file=/etc/kubernetes/pki/ca.crt`

> 所有针对Pod的操作都会被kubelet监听到
