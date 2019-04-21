# image镜像

分层构建机制：最底层bootfs，rootfs

* bootfs：系统引导文件系统，包括bootloader和kernel。容器启动完成后会被卸载以节约内存资源
* rootfs：bootfs之上，表现为docker容器的根文件系统

> docker中rootfs由内核挂载为只读模式，而后通过联合挂载额外挂载一个可写层
