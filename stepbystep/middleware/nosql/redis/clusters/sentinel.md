# 哨兵

启动哨兵进程：`redis-sentinel sentinel.conf`

#####sentinel.conf配置
`sentinel monitor master-name ip redis-port quorum`
* master-name 大小写字母、数字、“.-_”组成的主数据库名字
**考虑故障恢复后当前监控的系统主数据库地址端口变化，可通过主数据库名字获取当前系统主数据库地址和端口**
* ip 当前系统中主数据库的地址
* redis-port 端口号
* quorum 执行故障恢复操作前至少需要几个哨兵节点同意
