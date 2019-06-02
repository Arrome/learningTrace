# NodeManager

NodeManager
--------------
负责本地资源监控、故障报告、Container生命周期管理（启动杀死作业）<br>

与每台机器对应的从属进程（slave），**管理该节点上的用户作业和工作流**：<br>
* 负责应用程序的Container生命周期管理(启动、杀死作业)
* 监控本地可用资源使用情况（CPU、内存、磁盘、网络）
* 报告给ResourceManager


在验证Container租约后，为Container配置环境（应用程序制定的资源限制，初始化它的监控系统）




##### Container
资源抽象概念（CPU、内存、磁盘、网络）<br>
ResourceManager-scheduler分配资源的结果，为应用程序授予在特定主机上使用资源的权利 <br>

Container启动上下文（CLC），包括环境变量、远程存储上的依赖、安全令牌、NodeManager服务的负荷以及创建进程的必要命令。<br>
