# 安装

集群
----
方式1： static
1. 下载etcd二进制文件包`https://github.com/etcd-io/etcd/releases`
2. 创建目录`mkdir -p /usr/local/kubernetes/{bin,config}`
3. 配置环境变量
4. 拷贝etcd和etcdctl文件到bin目录`cp etcd* /usr/local/kubernetes/bin`
5. 配置/usr/lib/systemd/system/etcd.service文件
```
[Unit]
Description=Etcd Server
After=network.target
[Service]
Type=simple
WorkingDirectory=/var/lib/etcd
EnvironmentFile=-/usr/local/kubernetes/config/etcd.conf
ExecStart=/usr/local/kubernetes/bin/etcd \
        --name=${ETCD_NAME} \
        --data-dir=${ETCD_DATA_DIR} \
        --listen-peer-urls=${ETCD_LISTEN_PEER_URLS} \
        --listen-client-urls=${ETCD_LISTEN_CLIENT_URLS} \
        --advertise-client-urls=${ETCD_ADVERTISE_CLIENT_URLS} \
        --initial-advertise-peer-urls=${ETCD_INITIAL_ADVERTISE_PEER_URLS} \
        --initial-cluster=${ETCD_INITIAL_CLUSTER} \
        --initial-cluster-token=${ETCD_INITIAL_CLUSTER_TOKEN} \
        --initial-cluster-state=${ETCD_INITIAL_CLUSTER_STATE}
Type=notify
[Install]
WantedBy=multi-user.target
```
6. 配置etcd配置文件
```
#[member]
#修改为本机对应的名字，etcd02，etcd03
ETCD_NAME="etcd01"                                          
ETCD_DATA_DIR="/var/lib/etcd/default.etcd"
ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"

#[cluster]
#修改为本机IP
ETCD_INITIAL_ADVERTISE_PEER_URLS="http://192.168.42.51:2380"    
ETCD_INITIAL_CLUSTER="etcd01=http://192.168.42.51:2380,node1=http://192.168.42.195:2380,node2=http://192.168.42.192:2380" # 多个节点值都为new   
ETCD_INITIAL_CLUSTER_STATE="new"
ETCD_INITIAL_CLUSTER_TOKEN="k8s-etcd-cluster"
#修改为本机IP
ETCD_ADVERTISE_CLIENT_URLS="http://192.168.42.51:2379"
```
7. 依次启动多个节点的etcd.service

方式2： etcd discovery

方式3： dns discovery
