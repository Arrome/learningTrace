# 容器跨主机互访

calico方式
---------
1. 安装etcd集群
2. etcd集群集成到各主机docker Engine：`--cluster-store=etcd://etcdHostIP:2379`
3. 安装calicoctl并配置etcd database以及安装calico/node
4. 创建calico网络
5. 各主机创建连接calico网络的容器
