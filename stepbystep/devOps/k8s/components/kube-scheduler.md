# kube-scheduler

**作用**：调度Pod（包括通过API Server新创建的Pod及RC为补足副本而创建的Pod等）通过一些复杂的调度流程计算出最佳的目标节点，然后绑定到该节点上，绑定信息写入etcd中。
