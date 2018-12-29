#zookeeper安装部署

集群模式
------
1. java运行环境
2. 下载zookeeper安装包，解压tar.gz包
3. 配置文件zoo.cfg(初次使用zookeeper需要把conf目录下zoo_sample.cfg重命名为zoo.cfg)
    * 集群模式下，集群中每台机器都需要感知整个集群由哪几台机器组成。配置文件中配置
    server.id=host:port:port
    (serverId标识该机器在集群中的机器序号)
    * 集群中所有机器上zoo.cfg文件内容应该都是一致的
4. 创建myid文件
    * zoo.cfg配置dataDir参数指定目录下创建myid文件，内容仅为一个数字且对应机器的serverID数字
     (确保每个服务器的myid文件中数字不同，且和自己机器id值一致，id范围1~255)
5. 按相同步骤，为其他机器配置zoo.cfg和myid文件
6. 启动服务器

7. 验证服务器
    * telnet 127.0.0.1 2181 和 stat

单机模式
-------
相对集群模式，可仅配置一个serverID即可

伪集群模式
----------
相对集群模式，多个server配置同一个IP地址，绑定不同端口
