# master 安装

kube-apiserver安装
---------------
方式一：二进制方式安装
1. 拷贝二进制文件到执行文件目录`cp kube-apiserver /usr/local/kubernetes/bin`
2. 配置kube-apiserver配置文件/usr/local/kubernetes/config/kube-apiserver
```
#启用日志标准错误
KUBE_LOGTOSTDERR="--logtostderr=true"
#日志级别
KUBE_LOG_LEVEL="--v=4"
#Etcd服务地址
KUBE_ETCD_SERVERS="--etcd-servers=http://192.168.42.51:2379"
#API服务监听地址
KUBE_API_ADDRESS="--insecure-bind-address=0.0.0.0"
#API服务监听端口
KUBE_API_PORT="--insecure-port=8080"
#对集群中成员提供API服务地址
KUBE_ADVERTISE_ADDR="--advertise-address=192.168.42.51"
#允许容器请求特权模式，默认false
KUBE_ALLOW_PRIV="--allow-privileged=false"
#集群分配的IP范围，自定义但是要跟后面的kubelet（服务节点）的配置DNS在一个区间
KUBE_SERVICE_ADDRESSES="--service-cluster-ip-range=192.168.0.0/24"
```
3. 配置服务文件/usr/lib/systemd/system/kube-apiserver.service
```
[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/kubernetes/kubernetes
[Service]
EnvironmentFile=-/usr/local/kubernetes/config/kube-apiserver
ExecStart=/usr/local/kubernetes/bin/kube-apiserver \
${KUBE_LOGTOSTDERR} \
${KUBE_LOG_LEVEL} \
${KUBE_ETCD_SERVERS} \
${KUBE_API_ADDRESS} \
${KUBE_API_PORT} \
${KUBE_ADVERTISE_ADDR} \
${KUBE_ALLOW_PRIV} \
${KUBE_SERVICE_ADDRESSES}
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
4. 加载启动服务

kube-scheduler安装
-----------------
1. 拷贝二进制文件到执行文件目录`cp kube-scheduler /usr/local/kubernetes/bin`
2. 配置kube-scheduler配置文件/usr/local/kubernetes/config/kube-scheduler
```
KUBE_LOGTOSTDERR="--logtostderr=true"
KUBE_LOG_LEVEL="--v=4"
KUBE_MASTER="--master=10.10.10.1:8080"
KUBE_LEADER_ELECT="--leader-elect"
```
3. 配置服务文件/usr/lib/systemd/system/kube-scheduler.service
```
[Unit]
Description=Kubernetes Scheduler
Documentation=https://github.com/kubernetes/kubernetes
[Service]
EnvironmentFile=-/usr/local/kubernetes/config/kube-scheduler
ExecStart=/usr/local/kubernetes/bin/kube-scheduler \
${KUBE_LOGTOSTDERR} \
${KUBE_LOG_LEVEL} \
${KUBE_MASTER} \
${KUBE_LEADER_ELECT}
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
4. 加载启动服务


kube-controller-manager安装
-----------------
1. 拷贝二进制文件到执行文件目录`cp kube-controller-manager /usr/local/kubernetes/bin`
2. 配置kube-scheduler配置文件/usr/local/kubernetes/config/kube-controller-manager
```
KUBE_LOGTOSTDERR="--logtostderr=true"
KUBE_LOG_LEVEL="--v=4"
KUBE_MASTER="--master=192.168.42.51:8080"
```
3. 配置服务文件/usr/lib/systemd/system/kube-controller-manager.service
```
[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/kubernetes/kubernetes
[Service]
EnvironmentFile=-/usr/local/kubernetes/config/kube-controller-manager
ExecStart=/usr/local/kubernetes/bin/kube-controller-manager \
${KUBE_LOGTOSTDERR} \
${KUBE_LOG_LEVEL} \
${KUBE_MASTER} \
${KUBE_LEADER_ELECT}
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
4. 加载启动服务

kubelet 安装
-----------
1. 配置kubeconfig配置文件/usr/local/kubernetes/config/kubelet.kubeconfig
```
apiVersion: v1
kind: Config
clusters:
  - cluster:
      server: http://192.168.42.51:8080                ###Master的IP，即自身IP
    name: local
contexts:
  - context:
      cluster: local
    name: local
current-context: local
```
2. 配置kubelet配置文件/usr/local/kubernetes/config/kubelet
```
# 启用日志标准错误
KUBE_LOGTOSTDERR="--logtostderr=true"
# 日志级别
KUBE_LOG_LEVEL="--v=4"
# Kubelet服务IP地址
NODE_ADDRESS="--address=192.168.42.51"
# Kubelet服务端口
NODE_PORT="--port=10250"
# 自定义节点名称
NODE_HOSTNAME="--hostname-override=192.168.42.51"
# kubeconfig路径，指定连接API服务器
KUBELET_KUBECONFIG="--kubeconfig=/usr/local/kubernetes/config/kubelet.kubeconfig"
# 允许容器请求特权模式，默认false
KUBE_ALLOW_PRIV="--allow-privileged=false"
# DNS信息，DNS的IP
KUBELET_DNS_IP="--cluster-dns=192.168.0.0"
KUBELET_DNS_DOMAIN="--cluster-domain=cluster.local"
# 禁用使用Swap
KUBELET_SWAP="--fail-swap-on=false"
```
3. 配置服务文件/usr/lib/systemd/system/kubelet.service
```
[Unit]
Description=Kubernetes Kubelet
After=docker.service
Requires=docker.service
[Service]
EnvironmentFile=-/usr/local/kubernetes/config/kubelet
ExecStart=/usr/local/kubernetes/bin/kubelet \
${KUBE_LOGTOSTDERR} \
${KUBE_LOG_LEVEL} \
${NODE_ADDRESS} \
${NODE_PORT} \
${NODE_HOSTNAME} \
${KUBELET_KUBECONFIG} \
${KUBE_ALLOW_PRIV} \
${KUBELET_DNS_IP} \
${KUBELET_DNS_DOMAIN} \
${KUBELET_SWAP}
Restart=on-failure
KillMode=process
[Install]
WantedBy=multi-user.target
```
4. 启动之前要先`swapoff -a`关闭swap，,然后启动服务


kube-proxy安装
------------
