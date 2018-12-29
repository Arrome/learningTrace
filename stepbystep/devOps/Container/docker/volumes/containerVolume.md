# 数据卷容器

创建一个数据卷容器dbdata
---------
例如： `docker run -it -v /dbdata --name dbdata ubuntu`

挂载dbdata容器数据卷
------------------
例如：`docker run -it --volumes-from dbdata --name db ubuntu`

> * 多次使用 --volumes-from参数从多个容器挂载多个数据卷<br>
> * **可以从其他已经挂载了容器卷的容器来挂载数据卷**，例如：`docker run -d --name db2 --volumes-from db ubuntu`<br>
> 使用 --volume-from 所挂载数据卷的**容器自身不需要保持运行状态**<br>
> * **删除数据卷容器，数据卷不会自动删除。如果要删除一个数据卷，需要删除最后一个还挂载着的容器**
> 要删除主机默认挂载卷，需要显式使用命令`docker rm -v` (是指/var/lib/docker/volumes目录下的卷目录，不指明此文件夹是不会被删除的)

数据卷容器迁移数据
--------------
###备份
例如：`docker run --volumes-from dbdata -v $(pwd):/backup --name worker ubuntu tar cvf /backup/backup.tar /dbdata`

###恢复
1. 先创建一个带有数据卷的容器<br>
例如：`docker run -v /dbdata --name dbdata2 ubuntu /bin/bash`
2. 创建一个新的容器，挂载dbdata2容器，并使用untar解压备份文件到挂载的容器卷中<br>
例如：`docker run --volumes-from dbdata2 -v $（pwd):/backup busybox tar xvf /backup/backup.tar`
