# namespace

namespace 实现资源隔离<br>
存在于`/proc/xxx(PID)/ns`


|Namespaces类型|系统调用参数|作用|
|--------------|-----------|-------|
|Mount Namespace|CLONE_NEWNS|隔离挂载点（文件系统）|
|UTS Namespace|CLONE_NEWUTS|隔离主机名与域名|
|IPC Namespace|CLONE_NEWIPC|隔离信号量、消息队列、共享内存|
|PID Namespace|CLONE_NEWPID|隔离进程编号|
|Network Namespace|CLONE_NEWNET|隔离网络设备、网络栈、端口等|
|User Namespace|CLONE_NEWUSER|隔离用户和用户组|
