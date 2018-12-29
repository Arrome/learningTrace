# 容错性

横向扩容过程中，超出扩容极限，如何提升容错性：
1. primary shard和replica shard自动负载均衡
2. 每个node有更少的shard，IO/CPU/Memory资源分给每个shard分配更多，每个shard性能更好
3. 扩容极限，6个shard（3个primary，3个replica）最多扩容到6台机器，每个shard占用单台服务器所有资源，性能最好
4. 超出扩容极限，动态修改replica数量，9个shard（3个primary，6个replica），扩容到9台机器，比3台机器时，拥有3倍吞吐量
4. 3台机器，9个shard（3个primary，6个replica）资源更少，但容错性更好，最多容纳2台机器宕机，6个shard最多容忍1台机器宕机

master选举，replica容错，数据恢复
---------------------------
1. 当master node宕机，自动选取另一个node作为master（状态：red）
2. 新master会将丢失的primary shard的某个replica shard提升为primary shard。（状态：yellow）
3. 重启故障node，会将丢失的副本都拷贝一份到该node上（状态：green）
