# DataNode

启动时会想nameNode汇报block信息<br>
通过向nameNode发送心跳检测，如果未收到心跳，认为丢失，会拷贝其上的block到其他DataNode上<br>
