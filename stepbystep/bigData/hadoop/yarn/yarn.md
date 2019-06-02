# yarn

客户端资源请求
----------
1. 客户端通知RM，要提交一个application
2. RM在应答中给出一个ApplicationID 以及 有助于客户端请求资源的集群容量信息
3. 客户端使用Application Submission Context 发出响应，包含ApplicationID、用户名、队列以及启动ApplicationMaster所需要的信息<br>
    Container Launch Context(CLC，资源需求CPU/内存、作业文件、安全令牌、节点上启动ApplicationMaster需要的其他信息)也会发给RM
4. RM 收到后，会为ApplicationMaster调度一个可用的Container。（Container0必须请求其他Container）若无可用，必须等待。若有合适，联系相应的NodeManager启动ApplicationMaster。建立Application的RPC端口和用于跟踪的URL
5. NM 启动 ApplicationMaster，并发送RM 注册请求。
6. RM 响应关于集群最小最大容量信息
7. ApplicationMaster 基于RM的可用资源报告，请求一定量的Container
8. RM基于调度策略，尽可能最优的为ApplicationMaster分配Container资源，应答给ApplicationMaster

-----------------------------------------

1. 随着作业执行，ApplicationMaster将心跳（请求和释放Container）和进度信息通过心跳发给RM
