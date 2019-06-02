# ResourceManager

resourceManager
-----------
基于扩展性需求，RM和NM之间通过心跳通信(所有通信使用了可扩展的网络协议Google Protocol Buffers)。RM依赖NM维护集群全局视图 <br>

##### Scheduler
基于应用程序ApplicationMaster的资源请求进行调度（严格限制系统的可用资源,在保证容量、公平性及服务等级（SLA）前提下，优化资源利用率。）<br>
resourceManager的一个可插拔的调度器组件，根据不同调度算法：<br>
* 负责运行中的各种应用分配资源（分配会受到容量、队列及其他因素的制约）。
* 不负责应用程序的监控和状态跟踪，也不保证应用程序失败或者硬件失败的情况下对task的重启。


ApplicationManager
----------------
实际上是特定框架库的一个实例（应用框架相关代码转移到ApplicationManager，系统可以支持MapReduce、MPI、图计算等多种框架），Container身份运行<br>
**与应用程序一一对应**<br>
* 负责与Scheduler协商合适的Container
* 跟踪应用程序状态，监控他们进度(与nodeManager配合)
* ApplicatonManager取走Container，并给NodeManager，NM利用相应的资源启动Container的任务进程。

> 本质上是用户程序，不可信。Container分配要以一种安全方式验证，保证ApplicationManager不能伪造集群中的应用
