# kafka-topic.sh

```
# 创建topic 指定分区副本
./kafka-topics.sh --create --zookeeper kafka_zookeeper_1:2181 --replication-factor 1 --partitions 1 --topic test

# 列出topic
./kafka-topics.sh --list --zookeeper kafka_zookeeper_1:2181


```
