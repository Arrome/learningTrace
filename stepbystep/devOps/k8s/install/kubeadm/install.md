# Install
1. 添加kubernetes仓库源
2. 安装k8s服务<br>
  `yum install -y kubelet kubeadm kubectl`<br>
  `systemctl enable kubelet.service`<br>
  `systemctl restart kubelet.service`<br>

3. 准备
  * 关闭防火墙，或者确认6443 10250端口开放：`systemctl stop firewalld`<br>
  * 安装docker
  * 关闭swap（性能考虑，交换减慢速度）
  * `echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables`

4. 初始化集群<br>
`kubeadm init --kubernetes-version=1.13.1 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.186.129`<br>
`--pod-network-cidr=10.244.0.0/16`参数用于指定Pod网络范围，依赖使用的网络方案。此flannel作为网络插件,网段为flannel默认

5. 安装flannel网络
  `kubectl apply -f xxx.yaml`

添加node节点
--------
1. node节点安装
`yum install -y kubelet kubeadm`<br>
`systemctl enable kubelet.service`<br>

2. 准备
  * 安装docker
  * 关闭swap
3. 加入集群
  `kubeadm join --token be0204.4f256def3933a7d6 192.168.6.110:6443 --discovery-token-ca-cert-hash sha256:9b1677f2a9121e89341daa5ce0dad0da2214cf1210857e1369033c43ad60b559`<br>
若命令忘记可查看：`kubeadm token create --print-join-command`<br>

> 过程中需要kube-proxy，pause，flannel容器镜像就绪
