# hdfs

NameNode
----------
NameNode保存metadate信息（启动后加载到内存，metadata信息存储到磁盘文件名为fsimage，block位置信息不会保存，edits记录对metadata操作记录日志会跟fsimage进行合并）：
* 文件owership和permissions
* 文件包含哪些块
* Block保存在哪个DataNode上(DataNode启动时上报)

SecondaryNode
--------------
作用：主要帮助nameNode合并edits log，减少nameNode启动时间<br>

DataNode
----------
启动时会想nameNode汇报block信息<br>
通过向nameNode发送心跳检测，如果为收到心跳，认为丢失，会拷贝其上的block到其他DataNode上<br>


* hdfs 副本大小更改，会从新分配么？副本数量修改，已有的块会从新加副本么
