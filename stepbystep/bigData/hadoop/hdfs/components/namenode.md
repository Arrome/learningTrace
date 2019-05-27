# NameNode

NameNode保存metadate信息（启动后加载到内存，metadata信息存储到磁盘文件名为fsimage，block位置信息不会保存，edits记录对metadata操作记录日志会跟fsimage进行合并）：
* 文件owership和permissions
* 文件包含哪些块
* Block保存在哪个DataNode上(DataNode启动时上报)

checkpoint过程
------------
