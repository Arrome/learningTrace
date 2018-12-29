# grains

**应用场景**：
1. minion信息查询，grains保存收集到的客户端的详细信息（存储在minion端，minion每次启动货重启时采集的静态数据）<br>
  `salt '*' grains.items` 查看全部信息<br>
  `salt '*' grains.get hwaddr_interfaces`或`salt '*' grains.item hwaddr_interfaces` 查看特定信息<br>
  `salt '*' grains.get hwaddr_interfaces:eth0` 查看特定子集信息
2. target中使用，用来匹配minion
3. state中使用，用于配置管理模板
