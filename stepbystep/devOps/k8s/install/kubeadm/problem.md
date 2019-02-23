# 问题

问题：kubeadm安装需要从k8s.grc.io仓库中拉取所需镜像文件<br>
解决：docker.io仓库对google的容器做了镜像
```
docker pull mirrorgooglecontainers/kube-apiserver-amd64:v1.11.3
docker pull mirrorgooglecontainers/kube-controller-manager-amd64:v1.11.3
docker pull mirrorgooglecontainers/kube-scheduler-amd64:v1.11.3
docker pull mirrorgooglecontainers/kube-proxy-amd64:v1.11.3
docker pull mirrorgooglecontainers/pause:3.1
docker pull mirrorgooglecontainers/etcd-amd64:3.2.18
docker pull coredns/coredns:1.1.3
```
tag修改镜像标签
```
docker tag docker.io/mirrorgooglecontainers/kube-proxy-amd64:v1.11.3 k8s.gcr.io/kube-proxy-amd64:v1.11.3
docker tag docker.io/mirrorgooglecontainers/kube-scheduler-amd64:v1.11.3 k8s.gcr.io/kube-scheduler-amd64:v1.11.3
docker tag docker.io/mirrorgooglecontainers/kube-apiserver-amd64:v1.11.3 k8s.gcr.io/kube-apiserver-amd64:v1.11.3
docker tag docker.io/mirrorgooglecontainers/kube-controller-manager-amd64:v1.11.3 k8s.gcr.io/kube-controller-manager-amd64:v1.11.3
docker tag docker.io/mirrorgooglecontainers/etcd-amd64:3.2.18  k8s.gcr.io/etcd-amd64:3.2.18
docker tag docker.io/mirrorgooglecontainers/pause:3.1  k8s.gcr.io/pause:3.1
docker tag docker.io/coredns/coredns:1.1.3  k8s.gcr.io/coredns:1.1.3
``````

问题：kubelet报错`Unable to update cni config: No networks found in /etc/cni/net.d`
解决：没有下载flannel镜像，参考官网https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/下载

问题：安装中kubelet-check报错`error execution phase upload-config/kubelet: Error writing Crisocket information for the control-plane node: timed out waiting for the condition`
分析：查看kubelet日志`journalctl -f -u kubelet`显示尝试注册node节点，未认证
解决：待解决
