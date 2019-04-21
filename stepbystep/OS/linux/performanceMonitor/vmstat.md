# vmstat

vmstat
----------
显示所有虚拟处理器的信息（CPU，内存，IO ...）<br>

>设置时间间隔，默认显示最后一次启动以来数据。<br>
`vmstat 2 1` 第一个参数是采样的时间间隔数，单位：秒；第二个参数是采样次数

######procs:
1. r 等待运行的进程数，如果越大代表CPU越忙
2. b 阻塞进程队列数（IO，页面调度等）

######CPU：
1. us 用户态CPU使用率
2. sy 系统态CPU使用率
3. id 空闲率(CPU可用率)
4. ni 用户进程空间内改变过优先级的进程占比
5. wa 等待输入输出的占比
6. hi 硬中断占比
7. si 软中断占比
8. st 实时占比
######MEM：
1. swpd 虚拟内存已经使用的大小
2. free 空闲物理内存大小
3. buff 用作buffer（主要块设备缓存）的内存数，KB
4. cache 用作cache（主要缓存文件）的内存数，KB

5. inact  inactive内存总量（-a 选项）
6. active active内存总量（-a 选项）

######Swap：
1. si 从磁盘交换到swap虚拟内存的交换页数量，KB/s
2. so 从swap虚拟内存到磁盘的交换页数量，KB/s

######IO：
1. bi 每秒从块设备接收到的块数
2. bo 每秒发送到块设备的块数

######System：
1. in 每秒的中断数
2. cs 每秒的上下文切换数