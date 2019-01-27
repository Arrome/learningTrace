# install

docker跨主机访问
----------
作为docker的跨主机网络解决方案，安装使用版本V2.6 <br>
参考：`https://docs.projectcalico.org/v2.6/getting-started/docker/installation/manual`<br>
1. 下载calicoctl,并改权限`wget -O /usr/local/bin/calicoctl https://github.com/projectcalico/calicoctl/releases/download/v1.6.5/calicoctl && chmod +x /usr/local/bin/calicoctl`
2. 配置calico（etcd数据库）：默认配置文件：`/etc/calico/calicoctl.cfg`
```
apiVersion: v1
kind: calicoApiConfig
metadata:
spec:
  datastoreType: "etcdv2"
  etcdEndpoints: "http://etcd1:2379,http://etcd2:2379"
```
3. 安装calico/node,**以容器方式运行**:`calicoctl node run --node-image=quay.io/calico/node:v2.6.12`
4. 检查安装情况：`calicoctl node status`,`calicoctl get nodes --out=wide`
5. 创建calico网络:`docker network create --driver calico --ipam-driver calico-ipam net1`
6. 运行连接calico网络的容器
