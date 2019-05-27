# problems

* 问题：报错`Incompatible clusterIDs in /data/dfs/data`
  原因：namenode 重新format后，datanode的目录需要删除，否则保存有上个集群信息加锁不可用
