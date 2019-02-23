# 容器常见操作

* 以root用户进入终端：`docker exec -it -u root containerId bash`

* 同步容器与主机时间：`docker run --name <name> -v /etc/localtime:/etc/localtime:ro ....`或者 `docker cp /etc/localtime:containerId/etc/localtime` 或者`docker cp /etc/localtime containerId:etc/localtime`

* 查看容器环境变量：`docker run containerId env`，`docker exec containerId env`
