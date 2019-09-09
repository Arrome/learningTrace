# docker kafka存在问题

* 问题：kafka-topics.sh 正常使用，producter和consumer报错
  猜测：是server.properties的`listeners=PLAINTEXT://:9092`未配置