#Zookeeper(分布式数据一致性解决方案)
**目标**：封装好复杂易出错的关键服务，将简单易用接口和性能高效、功能稳定的系统提供给用户<br>
**适用场景**：解决分布式应用中经常遇到的一些数据管理问题(统一命名服务、状态同步服务、集群管理、分布式应用配置项管理...)

ZooKeeper提供通用的分布式锁服务，用以协调分布式应用

**工作原理**：
1. 每个server在内存中存储一份数据，定期落地磁盘
2. 启动时，将从实例中选举一个leader
3. leader负责处理数据更新等操作
4. 一个更新操作成功，当且仅当大多数server内存中成功修改数据

**特性优点**：
1. 最终一致性：为客户端展示同一视图
2. 可靠性：如果消息被一台机器接受，将被所有服务接受
3. 实时性：不能保证两客户端能同时得到刚更新的数据，如果需要最新数据，应该在读取之前调用sync接口
4. 独立性：各个client间互不干预
5. 原子性：更新只有成功或失败，没有中间状态
6. 顺序性：所有server，同一消息发布顺序一致(指follower转发后，leader的接收顺序)