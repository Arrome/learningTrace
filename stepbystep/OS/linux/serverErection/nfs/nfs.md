# NFS(Network File System)

网络中计算机通过 TCP/IP 网络共享资源。<br>
在 NFS 应用中，本地 NFS 客户端应用可以透明地读写位于远端 NFS 服务器文件<br>

**缺点**：
1. nfs属于本地文件系统，在高并发场景和大存储量下，需要使用分布式存储mfs，  FastDFS， tfs(taobao)等。
2. 客户端的数据都是通过**明文传送**。**客户端没有用户认证机制**，安全性能一般，所以**建议一般在局域网内使用**。
3. 容易发生单点故障，即server服务器宕机所有的客户端都不能访问。


nfs原理:
![nfs原理](../../img/nfs.png)


服务端：
----------
1. 需要安装 rpcbind（portmap） 和 nfs-utils
 ```
 rpm -qa | grep nfs
 rpm -qa | grep rpcbind

 yum -y install nfs-utils rpcbind
 ```
2. 创建共享目录/nfs 并设置文件权限

3. 编辑/etc/exports文件
  `/nfs *(rw,no_root_squash,no_all_squash,sync)`

  * rw ro        目录权限 读写 或 只读，最终能不能读写，还与文件系统的rwx及身份有关
  * sync async   sync 数据会同步写入到内存与硬盘；async 数据会暂存于内存中，而非直接写入硬盘
  * no_root_squash root_squash 默认客户端root身份会由root_squash设定压缩成nfsnobody，文件系统有保证；想客户端使用root身份操作服务器文件，需要开no_root_squash
  * all_squash 无论登入NFS使用者身份为何，都会被压缩为匿名用户nfsnobody
  * anonuid anongid 匿名这UID GID，必须存在于/etc/passwd
4. 使配置生效
  `exportfs -r` 或者 重启nfs服务`service nfs restart`
5. 测试
  `showmount -e` 显示某部主机 /etc/exports所分享的目录数据
  `showmount -a` 显示目前主机与客户端NFS的分享状态

客户端
--------
1. 安装 rpcbind 和 nfs-utils
2. 创建共享目录 /nfs
3. 查看服务器共享信息 `showmount -e 192.168.193.128`
4. `mount -t nfs 192.168.193.128:/nfs /nfs`

> 注意： 1. 需要关闭防火墙，防火墙未关闭mount挂载会报错：mount.nfs: No route to host
>      2. 使用`service iptables stop`报错：Failed to stop iptables.service: Unit iptables.service not loaded.
>        Centos7或RHEL7 防火墙由firewalld来管理，需要使用命令`systemctl stop firewalld`
