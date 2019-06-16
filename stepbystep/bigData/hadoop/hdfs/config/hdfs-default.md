# hdfs 配置

#####目录
`dfs.namenode.name.dir` <br>
`dfs.namenode.edits.dir` <br>
`dfs.namenode.edits.dir.required` 确保事务文件时最新的<br>
`dfs.namenode.edits.dir.minimum` 默认为1，可用的可选目录dfs.namenode.edits.dir个数必须大于等于此属性，否则报错<br>
`dfs.namenode.checkpoint.dir` <br>
`dfs.namenode.checkpoint.edits.dir` <br>

`dfs.namenode.legacy-oiv-image.dir` standby或secondarynamenode在checkpoint期间以旧fsimage格式保存namespace的位置。未指定，旧格式fsimage不会保存在检查点。可通过oiv-legacy命令转储旧格式fsiamge内容。
`dfs.user.home.dir.prefix` 默认/user,要添加到用户名以获取用户主目录的目录
`dfs.datanode.data.dir` <br>


NameNode
-------------
#####host
`dfs.namenode.rpc-address`
`dfs.namenode.rpc-bind-host`

`dfs.namenode.servicerpc-address`
`dfs.namenode.servicerpc-bind-host`

`dfs.namenode.lifeline.rpc-address`
`dfs.namenode.lifeline.rpc-bind-host`

#####web
`dfs.namenode.http-bind-host`
`dfs.namenode.http-address=0.0.0.0:50070`

`dfs.namenode.https-bind-host`
`dfs.namenode.https-address=0.0.0.0:50470`



secondarynamenode
----------
#####host

#####web
`dfs.namenode.secondary.http-address=0.0.0.0:50090`
`dfs.namenode.secondary.https-address=0.0.0.0:50091`


DataNode
-----------
`dfs.datanode.address=0.0.0.0:50010`
`dfs.datanode.ipc.address=0.0.0.0:50020`

#####webapp
`dfs.datanode.http.address=0.0.0.0:50075`


other
--------
`dfs.namenode.datanode.registration.ip-hostname-check=true` 默认使用hostname来访问，如果没有会报错解析不了，不能连接


#####高可用
`dfs.namenode.name.dir.restore` 默认false，设置为true，尝试恢复之前失败的dfs.namenode.name.dir目录，checkpoint时尝试 <br>
`dfs.namenode.shared.edits.dir` <br>
`dfs.journalnode.edits.dir` 默认/tmp/hadoop/dfs/journalnode/ <br>

#####权限
`dfs.datanode.data.dir.perm` 默认700<br>

`dfs.hosts` 包含允许连接到namenode的主机列表，指定文件完整路径。空则允许所有主机<br>
`dfs.hosts.exclude` 不允许连接到namenode的主机列表<br>

#####其他
`nfs.dump.dir` 每个文件无序写入在累积到超过存储器的特定阈值（例如 1MB）后被转储，**必须确保足够空间** <br>
