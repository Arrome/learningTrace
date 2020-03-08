

### GC 日志
`-Xloggc:log/gc.log` 当前目录下log文件夹下的gc.log文件记录所有gc日志
`-XX:+PrintGC` 打印GC日志
`-XX:+PrintGCDetails` 更详细信息,还会打印虚拟机退出前详细信息（各个区间的使用情况）
`-XX:+PrintHeapAtGC` 每次GC前后分别打印堆信息
`-XX:+PrintGCTimeStamps` GC发生时间，输出时间为虚拟机启动后的时间偏移量
`-XX:+PrintGCApplicationConcurrentTime` 打印应用程序的执行时间
`-XX:+PrintGCApplicationStoppedTime` 打印应用程序由于GC而产生的停顿时间
`-XX:+PrintReferenceGC` 系统内软引用、弱引用、虚引用、Finallize队列

### JVM参数
`-XX:+PrintVMOptions` 打印虚拟机接收到的命令行显式参数
`-XX:+PrintCommandLineFlags` 打印传递给JVM的显式和隐式参数
`-XX:+PrintFlagsFinal` 打印所有系统参数，多达500多行

### 直接内存
`-XX:MaxDirectMemorySize` 不设置，默认最大堆空间-Xmx。达最大值触发垃圾回收，若不能有效释放足够空间也会引起系统OOM

### 堆
`"-XX:OnOutOfMemoryError=xxx.sh"` OOM时执行脚本文件，可以用于崩溃程序自救、报警或者通知，获取更多的系统信息
`-XX:+HeapDumpOnOutOfMemoryError` OOM时导出整个堆信息
`-XX:+HeapDumpPath` 导出堆的存放路径

`-Xmx` 最大可用，设置和初始堆相等，减少程序运行时进行的垃圾回收次数，从而提高程序性能
`-Xms` 初始堆大小
`-XX:MaxHeapSize` 最大内存
`-Xmn` 新生代大小。（一般设置整个堆空间的1/3 - 1/4左右）设置较大的新生代会减少老年代的大小，对系统性能及GC行为有很大影响
`-XX:SurvivorRatio=eden/from=eden/to` 设置新生代中eden空间和from/to空间的比例关系。
`-XX:NewRatio=老年代/新生代`

### 栈
`-Xss` 线程栈大小

### GC 垃圾收集器
`-XX:+UseSerialGC` 指定新生代、老年代都使用串行收集器。client模式下，默认垃圾收集器
`-XX:+UseParNewGC` 新生代使用ParNew回收器，老年代使用串行收集器
`-XX:+UseParallelGC` 新生代使用ParallelGC，老年代使用串行收集器
`-XX:+UseConcMarkSweepGC` 新生代使用ParNew回收器，老年代使用CMS
    `-XX:ParallelGCThreads` 最好CPU数量相当，避免过多线程数，影响垃圾收集性能。
        默认，cpu小于8，ParallelGCThreads等于cpu数量，大于8，3+((5*CPU_Count)/8)
`-XX:+UseParallelGC` 新生代使用ParallelGC，老年代串行收集器
`-XX:+UseParallelOldGC` 新生代使用ParallelGC，老年代使用ParallelOldGC
    `-XX:MaxGCPauseMillis` 最大垃圾收集停顿时间。
    `-XX:GCTimeRatio` 吞吐量大小（0-100）。系统将花费不超过1/(1+n)的时间用于垃圾收集。默认n=99

### 跟踪类加载卸载(动态代理 AOP 等隐蔽类)
`-verbose:class`
`-XX:+TraceClassLoading` 
`-XX:+TraceClassUnLoading`

###（非堆）永久区 && 元数据区（Perm---JDK6-7,JDK8彻底移除改为metaspace）
使系统支持更多的类，大量的类可能导致溢出（动态代理加载更多的类）
`-XX:PermSize` 
`-XX:MaxPermSize` 默认64MB

`-XX:MaxMetaspaceSize` 堆外直接内存，不指定默认会耗尽所有可用系统内存

###栈上分配（线程私有对象，栈上分配）
* `-XX:+EliminateAllocations` 开启标量替换，允许对象打散分配在栈上（对象字段被视为对立局部变量进行分配）
* `-XX:+DoEscapeAnalysis` 启用逃逸分析，`-server`执行程序，在server模式才能使用逃逸分析
