# GC算法
### 复制算法
适用场景：存活对象较少，垃圾对象多（新生代）
核心思想：将原有的内存空间分为两块，每次只使用其中一块，垃圾回收时，将正在使用的内存中存活对象复制到未使用的内存块中
    之后，清除正在使用的内存块中的所有对象，交换俩个内存的角色，完成垃圾回收
理由：确保回收后的内存空间没有碎片。



### 标记压缩算法
适用场景：（老年代）
核心思想：从根节点开始，对所有可达对象做一次标记，之后并非简单清理未标记对象，而是将所有存活对象压缩到内存一端，清理边界外的所有空间。
    避免了碎片产生，又不需要两块相同内存空间。
    
# GC收集器
###串行收集器
场景：新生代｜老年代
核心：单线程，独占式垃圾回收，并行能力差的计算机，性能更好表现
特点：垃圾回收时，Java程序所有线程都要暂停，等待垃圾回收完成。（STW）

`-XX:+UseSerialGC` 指定新生代、老年代都使用串行收集器。client模式下，默认垃圾收集器
`-XX:SurvivorRatio` 设置eden区和survivior区大小的比例
`-XX:PretenureSizeThreshold` 设置大对象直接进入老年代的阈值
`-XX:MaxTenuringThreshold` 设置对象进入老年代的年龄的最大值

###ParNew回收器
场景：新生代
特点：简单将串行收集器多线程化，多线程，独占式同时进行回收

`-XX:+UseParNewGC` 新生代使用ParNew回收器，老年代使用串行收集器

###ParallelGC 并行回收器
场景：新生代
特点：复制算法的收集器。同ParNew，不同点：关注系统吞吐量（设置系统停顿时间和吞吐量），支持自适应GC调节策略（新生代大小，eden和survivior的比例、晋升老年代对象年龄等参数会被自动调整，以达到堆大小、吞吐量和停顿时间间的平衡点）

###ParallelOldGC 回收器
场景：老年代
特点：标记压缩算法

###CMS(concurrent mark sweep) 并发标记清除 回收器
特点：多线程并行回收。关注系统停顿时间，它使用标记清除算法
过程：初始标记（STW 标记根对象）-》并发标记（标记所有对象）——》预清理（清理前准备及控制停顿时间）
-》重新标记（STW 修正并发标记数据）——》 并发清理（清理垃圾）-》并发重置（初始化CMS数据结构和数据，为下次垃圾回收做准备）
默认启动并发线程数是`（ParallelGCThreads + 3）/ 4` ParallelGCThreads表示GC并行时使用的线程数量。
CMS回收器，如果需要回收Perm区，默认情况要触发一次FullGC。必须打开`-XX:+CMSClassUnloadingEnabled`开关

`-XX:+UseConcMarkSweepGC` 新生代使用并行收集器，老年代使用CMS+串行收集器
`-XX:ParallelCMSThreads` 设定CMS线程数量
`-XX:CMSInitiatingOccupancyFraction` 
`-XX:+UseCMSCompactAtFullCollection`
`-XX:CMSFullGCsBeforeCompaction`
`-XX:+CMSClassUnloadingEnabled`
`-XX:CMSInitatingPermOccupancyFraction`
`-XX:UseCMSInitiatingOccupancyOnly`
`-XX:+CMSIncrementalMode`

###G1 回收器
JDK7 引入，分代垃圾回收器（分区算法），区分年轻代老年代，有eden区和survivor区
`-XX:+UseG1GC` 打开G1收集器
`-XX:MaxGCPauseMillis` 指定目标最大停顿时间
`-XX:ParallelGCThreads` 并行回收时，GC工作线程数量