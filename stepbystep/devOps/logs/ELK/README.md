
ElasticSearch:对海量规模数据完成分布式索引和检索，还能提供数据聚合分析
Logstash：有效处理来源于各种不同数据源的日志信息
Kibana：可视化分析结果
Filebeat: 轻量级数据收集引擎。基于原先 Logstash-fowarder 的源码改造出来。
  引入目的：如果日志的量很大，Logstash 会遇到资源占用高的问题
  优势：GoLang语言开发，无需依赖 Java 环境，**效率高，占用内存和 CPU 比较少**，非常适合作为 Agent 跑在服务器上
