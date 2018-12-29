# kubelet

**作用**：
1. 处理master节点下发到本节点的任务，管理Pod及Pod中的容器<br>
2. 启动时通过API Server注册自身的节点信息，并定时向API Server汇报状态信息，API Server收到信息后，将信息更新到etcd中。通过cAdvisor监控容器和节点资源<br>

etcd中存储的节点信息包括：节点健康状况、节点资源、节点名称、节点地址信息、操作系统版本、Docker版本、kubelet版本等。<br>

节点上的kubelet通过API Server监听到kube-scheduler产生Pod绑定事件后，获取对应的Pod清单，下载Image镜像，并启动容器<br>

kubeconfig配置
-----------



> 所有针对Pod的操作都会被kubelet监听到
