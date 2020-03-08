# overlay VS overlay2
## 特点
* overlay2 比 overlay 在inode利用率上更高效,推荐overlay2
* overlay和overlay2 比aufs和devicemapper性能都要好。一般情况下overlay2可能比btrfs还要好
* overlay 和 overlay2 都支持后台文件系统 xfs，但是 `d_type=true`必须开启
* 改变存储驱动，会导致镜像容器不可用（更改前可`docker save`）
## overlay2 使用要求
* 需要linux kernel >=4.0 或者 RHEL/centos >=3.10.0-514
* docker >=17.06.02-ee5，

## overlay 使用要求
* docker EE 18.09不支持overlay
* linux kernel >=3.18 且 overlay模块加载（`lsmod ｜ grep overlay`）

## overlay 结构
显示   ---  merged
容器层 ---  upperdir
镜像层 ---  lowerdir
* 每个镜像层都在`/var/lib/docker/overlay`目录下创建自己的目录（目录和镜像层id并不对应）<br>
    运行容器的下层目录：<br>
    * lower-id 镜像层id
    * upper 容器读写层
    * work
    * merged  联合挂载lower和upper
* 使用硬连接引用底层共享数据以节省空间（硬连接不占用磁盘空间）。就会导致inode过度使用（增加可用索引节点数量的唯一方法是对其进行重新格式化）

## overlay2 结构
* `/var/lib/docker/overlay2`目录下创建目录，`l`目录作为缩短表示软连
* 最底层 
    * link 文件--为简短标识名，
    * diff目录--包含层内容
* 上层
    * lower 指向父层
    * diff目录 -- 包含层内容
    * merged -- 包含父层以及本身
    * work
## overlay overlay2 读文件
* 文件不存在容器层，镜像层存在，从镜像层读，几乎没有性能消耗
* 文件仅仅存在容器层，直接从容器层读
* 文件容器和镜像层都存在，将从容器层读，镜像层同名文件模糊

## overlay overlay2 修改文件或目录
