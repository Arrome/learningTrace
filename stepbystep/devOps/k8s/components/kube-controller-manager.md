# kube-controller-manager

集群内部的管理控制中心，负责集群内的Node、Pod副本、服务端点（Endpoint）、命名空间（Namespace）、服务账号（ServiceAccount）、资源定额（ResourceQuota）等的管理。当某个Node意外宕机时，ControllerManager会及时发现故障并执行自动化修复流程，确保集群始终处于预期的工作状态。<br>
包括：Replication Controller、Node Controller、ResourceQuota Controller、Namespace Controller、ServiceAccount Controller、Token Controller、Service Controller以及Endpoint Controller等多个Controller。<br>

Replication Controller(副本控制器)
-----------------
**核心作用**：确保在任何时候集群中一个资源对象（RC）所关联的Pod副本数量保持预设值。
> **注意**：只有当Pod的重启策略是Always时（RestartPolicy=Always），Replication Controller才会管理该Pod的操作（例如创建、销毁、重启等）<br>
通常情况下，Pod对象被成功创建后不会消失，唯一例外是当Pod处于succeeded或failed状态的时间过长（超时参数由系统设定）时，该Pod会被系统自动回收，管理该Pod的副本控制器将在其他工作节点上重新创建运行该Pod副本

Node Controller
------------

ResourceQuota Controller（资源配额管理）
---------------
三个层次资源配额管理：
1. 容器级别：对CPU和Memory进行限制
2. Pod级别：对一个Pod内所有容器的可用资源进行限制
3. Namespace级别：为Namespace(多租户)级别限制，包括Pod数量，RC数量，Service数量，ResourceQuota数量，Secret数量，可持有的PV数量

K8S配额管理是**通过Admission Control（准入控制）来控制**，提供两种方式：1.LimitRanger，作用在Pod和Container上 2.ResourceQuota，作用在Namespace上，限定一个Namespace里各类资源使用总额
