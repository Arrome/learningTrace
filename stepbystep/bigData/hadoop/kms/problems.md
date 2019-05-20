# problems

* 问题：hdfs文件系统操作，报错`SafeModeException: Cannot create encryption zone on /crypto. Name node is in safe mode.`<br>
  原因：分布式文件系统启动时，会有安全模式，此模式下文件系统中内容不允许修改删除。安全模式主要是为了系统启动的时候检查各个DataNode上数据块的有效性，同时根据策略必要的复制或者删除部分数据。<br>
  解决：系统启动时的修改删除，只需要等待一会。手动离开安全模式:`bin/hadoop dfsadmin -safemode leave`<br>
