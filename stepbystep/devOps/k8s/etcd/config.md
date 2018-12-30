# 配置

etcd命令启动参数
--------
* `--name=xxx` ： etcd集群中节点名，任意（可区分且不重复）
* `--listen-peer-urls=http://0.0.0.0:2380` : 监听用于节点间通信的url，可监听多个，集群内部将通过这些url进行数据交互
* `--initial-advertise-peer-urls=http://xxx.xxx.xxx.xxx:2380` 建议用于节点间通信的url，节点间将以该url进行通讯
* `--listen-client-urls=http://0.0.0.0:2379` 监听用于客户端通信的url，同样可以监听多个
* `--advertise-client-urls=http://xxx.xxx.xxx.xxx:2379` 建议使用的客户端通信url，该值用于etcd代理或etcd成员与etcd节点通信
* `--initial-cluster-token=etcd-cluster-1` 节点token值，设置该值后集群将生成唯一id，并为每个节点也生成唯一id。当使用相同配置文件再启动一个集群时，只要该token值不一样，etcd集群就不会互相影响
* `--initial-cluster= ` 集群中initial-advertise-peer-urls的合集
* `--initial-cluster-state=new` 新建集群标志，初始化状态使用new，建立后改为existing

* `--data-dir=/xxx/xxx`
