# kafka-topic.sh

```
# 创建topic 指定分区副本
./kafka-topics.sh --create --zookeeper kafka_zookeeper_1:2181 --replication-factor 1 --partitions 1 --topic test

# 列出topic
./kafka-topics.sh --list --zookeeper kafka_zookeeper_1:2181

# 修改（只能增加分区，不能减少分区）
./kafka-topics.sh --alter --zookeeper zookeeper:2181  --partitions 3 --topic test

# 详细信息
./kafka-topics.sh --describe --zookeeper zookeeper:2181  --topic test

# 删除主题
./kafka-topics.sh --delete --zookeeper zookeeper:2181  --topic test
```
