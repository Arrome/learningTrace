# problems

* 问题：报错`Incompatible clusterIDs in /data/dfs/data`<br>
  原因：namenode 重新format后，datanode的目录需要删除，否则保存有上个集群信息加锁不可用<br>

* 问题：启动namenode报错` `<br>
  原因：元数据被破坏<br>
  解决: `hadoop namenode -recover`<br>
