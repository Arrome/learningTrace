# httpfs VS webhdfs

都提供REST API，使集群外host可以不用安装hadoop和java环境可以对集群进行访问,且客户端不受语言限制。<br>


webhdfs
---------
HDFS 内置，默认开启的服务<br>
面向集群所有节点（首先通过namenode，然后转发到响应的datanode）


HttpFS
--------
独立服务，需要配置开启
面向集群中的一个节点（该节点被配置为HttpFS的gateway）
