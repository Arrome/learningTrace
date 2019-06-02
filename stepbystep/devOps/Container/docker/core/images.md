# image镜像

分层构建机制：最底层bootfs，rootfs

* bootfs：系统引导文件系统，包括bootloader和kernel。系统启动时加载，启动完成后会被卸载以节约内存资源
* rootfs：用户空间的文件系统，在bootfs之上，表现为docker容器的根文件系统（/dev、/proc、/bin等目录）

> base镜像只在用户空间和发行版一致，kernel和宿主机发行版本一致 <br>
  **容器只能使用宿主机的kernel,且不能修改,不能升级kernel版本**<br>
> **docker中rootfs由内核挂载为只读模式，而后通过联合挂载额外挂载一个可写层**
