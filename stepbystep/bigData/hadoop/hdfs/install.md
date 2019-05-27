# install

Namenode
--------
本节点至少配置：
core-default 配置`fs.default.name`<br>
hdfs-default 配置重写`dfs.namenode.http-address`


DataNode
--------
本节点至少配置：
core-default 配置`fs.default.name`<br>

SecondaryNamenode
-------------
在namenode节点配置：
core-default 配置`dfs.namenode.secondary.http-address`
配置slave文件主机ip：`hadoop-daemons.sh --hosts slaves start secondarynamenode`

* hdfs 副本大小更改，会从新分配么？副本数量修改，已有的块会从新加副本么
