# ApplicationManager


ApplicationMaster
------
**每个用户作业的主进程，协调集群中应用程序执行的进程**<br>
**管理用户作业生命周期（包括动态增加或减少Container资源使用，管理执行流程，处理故障和计算偏差，执行本地优化）**<br>

ApplicationMaster（作为一个Container）启动后，会周期性向RM发送心跳确认其健康以及更新资源请求。在建好需求模型后，ApplicationMaster在发往RM的心跳中封装好它的偏好和限制。在随后的心跳应答中，ApplicationMaster会收到对集群特定节点上绑定了一定资源的Container租约。根据RM发来的Container，ApplicationMaster更新它的执行计划以适应资源过剩和不足。

运行中的Container会通过应用程序特定协议与ApplicationMaster通信，报告状态和健康信息，以及接受框架特定命令。通过此方式，提供对Container的监控和生命周期管理的基础框架，特定语义由每个框架独立管理<br>

> 基于令牌的安全机制保证了ApplicationMaster在NodeManager上使用Container的可靠性
