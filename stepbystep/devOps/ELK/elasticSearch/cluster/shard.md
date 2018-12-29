# shard & replica

1. index包含多个shard
2. 每个shard都是一个最小工作单元，承载部分数据。lucene实例，完整的建立索引和处理请求的能力
3. 增减节点时，shard会自动在nodes中负载均衡
4. 每个document只存在于某个primary shard以及对应的replica shard中，不可能存在多个primary shard
5. replica shard是primary shard的副本，负责容错以及承担读请求负载
6. primary shard的数量在创建索引时固定，replica shard数量随时可以修改
7. primary shard默认数量为5，replica数量默认为1，默认有10个shard，5个primary shard，5个replica shard
8. primary shard不能和自己的replica shard放在同一个节点，但可以和其他primary shard的replica shard放在同一个节点上
