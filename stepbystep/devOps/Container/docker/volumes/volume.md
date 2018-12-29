# volume

linux数据卷保存目录：/var/lib/docker/volumes

命令行
--------------------

`docker volume ls` <br>
`docker volume inspect` <br>

`docker volume create` <br>
`docker volume rm` <br>
`docker volume prune` 移除不用的卷 <br>

卷属性
--------
`docker volume inspect` 查看属性：
1. CreatedAt：
2. Driver：
3. Labels：
4. Mountpoint： 挂载在主机的位置
5. Name： 卷名
6. Options：
7. Scope：

`docker inspect containerId`查看容器mounts属性：
1. Type
2. Name
3. Source
4. Destination
5. Dirver
6. Mode
7. RW
8. Propagation

备份与恢复
---------
备份：`docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata`<br>
恢复：`docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"`

> **卷的移除不能随着容器的删除而删除，需要单独删除命令删除**`docker volume rm volumeName`

> 当卷与服务一起使用时，仅支持 `--mount`<br>
`docker run -d --name devtest -v myvol:/app:ro nginx:latest`相当于`docker run -d --name devtest --mount source=myvol,target=/app,readonly nginx:latest`

> `--rm` 参数自动删除容器同时删除匿名卷，有名卷不会删除
