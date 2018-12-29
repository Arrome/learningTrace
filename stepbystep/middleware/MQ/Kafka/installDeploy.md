# 安装部署
基础环境
-------
1. JDK
2. ZooKeeper
3. SSH免密登陆

Kafka安装
---------
(代理默认端口9092)
1. 解压，配置环境变量PATH
2. 修改配置 $KAFKA_HOME/config/server.properties
3. 启动 Kafka，要保证ZooKeeper已正常启动
  $KAFKA_HOME/bin/kafka-server-start.sh -daemon ../config/server.properties
4. jps命令查看进程(ZooKeeper进程QuorumPeerMain和Kafka进程kafka)
5. 查看启动日志信息 $KAFKA_HOME/logs/server.log
6. 查看zookeeper节点信息


伪分布式环境部署
-------------
每个加载配置文件server.properties配置唯一broker.id和端口port

集群环境部署
-------
多台机器分别安装Kafaka，修改配置文件，保证集群中broker.id唯一，host.name为本机IP<br>
连接zookeeper集群配置(格式：zookeeper服务器IP:zookeeper客户端端口)：zookeeper.connect=server-1:2181,server-2:2181,server-3:2181

Kafka监控管理工具
-----------
* [Kafka-Manager github地址](https://github.com/yahoo/kafka-manager)
* [Kafka web console]()
* [KafkaOffsetMonitor]()
