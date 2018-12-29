# inotify
通过inotify可以监控文件系统中的添加、删除、修改、移 动等各种细微事件。利用这个内核接口，第三方软件（inotify-tools）就可以监控文件系统下文件的各种变化情况。如果没有类似inotify的机制，一般会采用轮询（cron）的方式实现这种功能，不能在第一时间反映文件系统变化而且浪费CPU时间
**缺点（缺陷）**：inotify在实际生产环境中，对于50-200KB的文件，inotify的最发并发量为200-300，如果客户端写入速度大于这个量，将会造成短暂的延迟
**功能**：
监视文件系统的变化(基于inode来监控)，在监听到文件系统变化后会向相应的应用程序发送事件
**应用场景**：
文件管理器
**工具**：
inotify-tools 是为linux下inotify文件监控工具提供的**一套c的开发接口库函数，同时还提供了一系列的命令行工具**<br>
              **用c编写的，除了要求内核支持inotify外，不依赖于其他**<br>
              提供两种工具：一是 inotifywait，它是用来监控文件或目录的变化，二是inotifywatch，它是用来统计文件系统访问的次数
**安装**：
1. 检查是否支持inotify：查看内核`uname -r`，查看文件目录`ls -l /proc/sys/fs/inotify`
2. 如果`yum -y install inotify-tools`没有inotify-tools，`wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo` 重新安装
3. `which inotifywait`

inotifywait 参数说明
--------------------
|参数名称 |	参数说明 |
|-------|--------|
|-m,--monitor |	始终保持事件监听状态|
|-r,--recursive |	递归查询目录|
|-q,--quiet |	只打印监控事件的信息|
|--exclude |	排除文件或目录时，不区分大小写|
|-t,--timeout |	超时时间|
|--timefmt |	指定时间输出格式|
|--format |	指定时间输出格式|
|-e,--event |	后面指定删、增、改等事件|

inotifywait events事件说明
---------------------
|事件名称	|事件说明|
|--------|-------|
|access |	读取文件或目录内容|
|modify |	修改文件或目录内容|
|attrib |	文件或目录的属性改变|
|close_write |	修改真实文件内容|
|close_nowrite |	 |
|close 	 ||
|open |	文件或目录被打开|
|moved_to |	文件或目录移动到|
|moved_from |	文件或目录从移动|
|move |	移动文件或目录移动到监视目录|
|create |	在监视目录下创建文件或目录|
|delete |	删除监视目录下的文件或目录|
|delete_self |	 |
|unmount |	卸载文件系统|

在/proc/sys/fs/inotify目录下有三个文件，对inotify机制有一定的限制：
1. max_user_watches #设置inotifywait或inotifywatch命令可以监视的文件数量(单进程)
2. max_user_instances #设置每个用户可以运行的inotifywait或inotifywatch命令的进程数
3. max_queued_events #设置inotify实例事件(event)队列可容纳的事件数量
