# zookeeper高可用及keepalive/heartbeat对比

zookeeper
----------
作为注册中心，多个server注册到zookeeper集群(以临时znode形式)，client从zookeeper集群获取活跃server(根据客户端断开连接，临时znode删除)

keepalive
--------

heartbeat
--------
