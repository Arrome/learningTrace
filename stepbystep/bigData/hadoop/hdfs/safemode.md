# safemode

当Namenode节点启动时，进入安全模式（启动刚格式化的HDFS不会进入安全模式）此阶段，DataNode向Namenode上报数据块列表，NameNode得到数据块位置信息，并对每个文件对应数据块副本进行统计<br>
最小副本条件满足时（一定比例的数据块都达到最小副本数）退出安全模式,否则就会对副本数不足的数据块安排DataNode进行复制，直到最小副本数<br>
安全模式下，系统处于只读，NameNode不会处理任何数据块复制删除命令<br>

安全模式相关配置项（hdfs-site.xml）
--------------------
`dfs.namenode.replication.min` 文件 最小的Block副本数量，默认1 <br>
`dfs.namenode.safemode.threshold-pct` 副本数达到最小要求的Block占系统总Block的百分比，超过时，满足离开安全模式。默认0.999f（99.9%）<br>
`dfs.namenode.safemode.min.datanodes` 离开安全模式最小可用的datanode数量，默认0 <br>
`dfs.namenode.safemode.extension` 满足块比例，可用datanode，同时满足此事件段内，可离开安全模式，默认1ms（避免符合后马上又不符合） <br>

安全模式命令
-------------
`hadoop dfsadmin -safemode get` 查看当前状态<br>
`hadoop dfsadmin -safemode enter` 进入安全模式<br>
`hadoop dfsadmin -safemode leave` 离开安全模式<br>
`hadoop dfsadmin -safemode wait` 一直等待直到安全模式结束<br>
