#zookeeper配置文件信息

zoo.cfg
--------
* tickTime=2000      发送心跳的间隔时间，毫秒(leader和follower间)
* dataDir            保存数据的目录
* clientPort=2181    客户端连接server的端口(zookeeper监听这个端口，接收客户端请求)
* initLimit=5        初始化连接时最长忍受多少个心跳时间间隔数，超过则连接失败(leader和follower间)
* syncLimit          请求和应答最长不能超过多少个心跳时间间隔数(leader和follower间)
* server.A=B:C:D     A:第几号服务器；B：服务器IP；C：服务器和集群中leader服务器交换信息的端口；D：万一集群中leader挂了，需要一个端口来重新进行选举，选举时服务器间通信端口