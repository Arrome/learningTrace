# rsync（remote synchronization） 工具实现数据远程同步备份

**优点**：
1. 适用linxu/unix/windows等多操作系统
2. 可实现全备份及增量备份，也可本地备份
3. 还可实现删除功能

**缺点**：
1. 同步数据需要扫描所有文件进行对比，才能增量传输，若百万千万级，扫描对比文件耗时，降低效率
2. rsync不能实时检测同步数据，由于时差问题导致数据不一致，无法应对故障完全恢复数据

**常用工作场景**：
1. 所有客户端数据同步到备份服务器（配合定时任务）
  定时两小时同步一次：
  `crontab -e * */2 * * * rsync -avz --password-file=/etc/rsync-client.pass /data/ root@192.168.0.18::data`
2. 实时同步（解决单点故障），rsync结合inotify功能做实时同步

**工作方式**：
1. 本地传输模式：单个主机本地之间数据传输（类似cp）
  `rsync -a /data /backup`
  * 不同于cp命令：rsync 增量拷贝，只会把不同内容拷贝过去，大大提升了性能
2. 远程shell传输模式：借助rcp，ssh等通道来传输数据（类似scp）
  `rsync -avz *.c foo:src` `rsync -avz foo:src/bar /data`<br>
  `rsync -av root@192.168.193.128::www /databack` `rsync -av /databack root@192.168.193.128::www`
3. 守护进程传输模式：以守护进程（socket）方式传输数据（rsync功能）
  rsync daemon 是事先在server端（**通用称呼，只要不是发起rsync请求的client端，就是server端**）上运行好的rsync后台进程(根据启动选项，也可以设置为非后台进程)，它监听套接字等待client端的连接，连接建立后所有通信方式都是通过套接字完成的。
  `rsync -avz /databack rsync://root@192.168.193.128/www`
  `rsync -avz rsync://root@192.168.193.128/www /databack`

> 列远程机的文件列表： `rsync -v rsync://192.168.78.192/www‘

服务器端
-------
1. 检查并安装 rsync：
  `rpm -qa|grep rsync` `yum -y install rsync`
2. 创建服务用户（管理本地目录），查看该用户UID GID信息
  `useradd -s /sbin/nologin -M rsync` `id rsync`
3. 生成 /etc/rsyncd.conf 配置文件

4. 创建密码文件 /etc/rsync.password
  格式：（用户名：密码）
5. 启动服务
  `rsync --daemon`
6. 设置开机启动
  `echo “rsync --daemon” >> /etc/rc.local`

服务器
-----
1. 检查并安装 rsync：
2. 推拉数据
`rsync -avz rsync://root@192.168.193.128/backup /nfs`

> 从远程服务器拉取数据到客户端正常，从本地推送到远程报错（配置read only默认为true）：
> rsync: read error: Connection reset by peer (104)
> rsync error: error in socket IO (code 10) at io.c(785) [sender=3.1.2]

/etc/rsyncd.conf配置说明：
```
##rsyncd.conf start##
uid = rsync
gid = rsync
use chroot = no
max connections = 200
timeout = 300
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsync.lock
log file = /var/log/rsyncd.log  #这个是rsync的log文件，比较有用
[backup]
path = /backup/
ignore errors
read only = false
list = false
hosts allow = 172.16.1.0/24
hosts deny = 0.0.0.0/32
auth users = rsync_backup
secrets file = /etc/rsync.password
```
|参数| 	说明|
|----|----|
|uid=rsync |	rsync使用的用户ID。缺省uid为-2，通常为nobody|
|gid=rsync |	rsync使用的组（用户所在的组）。缺省gid为-2，通常为nobody|
|use chroot=no |	如果为true，daemon会在给客户端传输文件前“chroot to the path”。这是rsync安全的一个配置，因为我们大多数都是在内网使用rsync，所以不用配置也可以|
|max connections=200 |	设置最大连接数，默认为0，意思为无限制，负值为关闭这个模块|
|timeout=300 |	默认为0，意思为no timeout，建议为300-500（s）|
|pid file=/var/run/rsyncd.pid |	rsync daemon启动后将其进程PID写入此文件。如果这个文件已经存在，rsync进程不会覆盖该文件，而是会终止|
|lock file=/var/run/rysncd.lock |	指定loc文件用来支撑max connections的参数，使得总连接数不会超过限制，默认为/var/run/rsyncd.lock|
|log file = /var/log/rsyncd.log |	rsync的日志文件|
|ignore errors |	忽略IO错误|
|read only = false |	**指定客户端是否可以上传文件，默认对所有模块都为true** |
|list = false |	是否允许客户端可以查看可用模块列表（类似ls），默认为true|
|hosts allow = 172.16.1.0/24 |	指定可以联系的客户端主机名或者ip地址或者地址段，默认情况没有此参数，即都可以连接|
|hosts deny = 0.0.0.0/32 |	指定不可联系的客户端主机名或IP地址或地址段，禁止他们连接。默认情况没有此参数，即都可以连接|
|auth users = rsync_backup |	指定以空格或逗号分隔的用户可以使用哪些模块，用户不需要在本地系统中存在，默认所有用户无密码的访问|
|secrets file = /etc/rsync.password |	指定用户名和密码存放的文件。格式：用户名：密码， 密码不超过8位|
|[backup] |	模块名称，需要用中括号括起来，起名没有特殊要求，但最好是有意义的名称，便于以后维护|
|path = /backup/ |	在这个模块中，daemon使用的文件系统或目录，目录的权限要注意和配置文件中的权限一致，否则会遇到读写问题。|
