# node 安装

安装kubelet和kube-proxy：
`cp {kubelet,kube-proxy} /usr/local/kubernetes/bin/`

kubelet 安装
------------
1. 配置kubeconfig配置文件/usr/local/kubernetes/config/kubelet.kubeconfig
```
apiVersion: v1
kind: Config
clusters:
  - cluster:
      server: http://192.168.42.51:8080
    name: local
contexts:
  - context:
      cluster: local
    name: local
current-context: local
```
2. 配置kubelet配置文件/usr/local/kubernetes/config/kubelet
```
#启用日志标准错误
KUBE_LOGTOSTDERR="--logtostderr=true"
#日志级别
KUBE_LOG_LEVEL="--v=4"
#Kubelet服务IP地址（自身IP）
NODE_ADDRESS="--address=192.168.42.195"
#Kubelet服务端口
NODE_PORT="--port=10250"
#自定义节点名称（自身IP）
NODE_HOSTNAME="--hostname-override=192.168.42.195"
#kubeconfig路径，指定连接API服务器
KUBELET_KUBECONFIG="--kubeconfig=/usr/local/kubernetes/config/kubelet.kubeconfig"
#允许容器请求特权模式，默认false
KUBE_ALLOW_PRIV="--allow-privileged=false"
#DNS信息，跟上面给的地址段对应
KUBELET_DNS_IP="--cluster-dns=192.168.0.0"
KUBELET_DNS_DOMAIN="--cluster-domain=cluster.local"
#禁用使用Swap
KUBELET_SWAP="--fail-swap-on=false"
```
3. 配置系统配置文件/usr/lib/systemd/system/kubelet.service
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
1. 配置配置/usr/local/kubernetes/config/kube-proxy
```
#启用日志标准错误
KUBE_LOGTOSTDERR="--logtostderr=true"
#日志级别
KUBE_LOG_LEVEL="--v=4"
#自定义节点名称（自身IP）
NODE_HOSTNAME="--hostname-override=192.168.42.195"
#API服务地址（MasterIP）
KUBE_MASTER="--master=http://192.168.42.51:8080"
```
2. 配置系统配置文件/usr/lib/systemd/system/kube-proxy.service
```
[Unit]
Description=Kubernetes Proxy
After=network.target
[Service]
EnvironmentFile=-/usr/local/kubernetes/config/kube-proxy
ExecStart=/usr/local/kubernetes/bin/kube-proxy \
${KUBE_LOGTOSTDERR} \
${KUBE_LOG_LEVEL} \
${NODE_HOSTNAME} \
${KUBE_MASTER}
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
3. 启动服务
