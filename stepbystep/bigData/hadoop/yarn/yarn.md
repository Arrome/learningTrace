# yarn

resourceManager
-----------
一个纯粹的调度器，根据应用程序ApplicationMaster的资源请求严格限制系统的可用资源,在保证容量、公平性及服务等级（SLA）前提下，优化资源利用率。<br>
##### Scheduler
resourceManager的一个可插拔的调度器组件，根据不同调度算法：<br>
* 负责运行中的各种应用分配资源（分配会受到容量、队列及其他因素的制约）。
* 不负责应用程序的监控和状态跟踪，也不保证应用程序失败或者硬件失败的情况下对task的重启。

NodeManager
--------------
与每台机器对应的从属进程（slave），**管理该节点上的用户作业和工作流**：
* 负责应用程序的Container生命周期管理(启动、杀死作业)
* 监控本地可用资源使用情况（CPU、内存、磁盘、网络）
* 报告给ResourceManager

ApplicationManager
----------------
实际上是特定框架库的一个实例（应用框架相关代码转移到ApplicationManager，系统可以支持MapReduce、MPI、图计算等多种框架），Container身份运行，**每个用户作业的主进程，管理用户作业生命周期（包括动态增加或减少Container资源使用，管理执行流程（如），处理故障和计算偏差，执行本地优化）**<br>
**与应用程序一一对应**<br>
* 负责与Scheduler协商合适的Container，跟踪应用程序状态，监控他们进度(与nodeManager配合)
* ApplicatonManager取走Container，并给NodeManager，NM利用相应的资源启动Container的任务进程。


Container
----------
一种资源分配的形式，ResourceManager-scheduler分配资源的结果，为应用程序授予在特定主机上使用资源的权利
