# RBAC 基于角色访问控制

apiServer默认创建一系列ClusterRole和ClusterRoleBinding。资源对象中名称`system:xxx`,属于kubernetes系统基础设施.<br>
RBAC默认的集群角色完成足够的覆盖，让集群可以完全在RBAC管理下运行<br>
> 例如`system:node`为ClusterRole定义了kubelet进程权限。如果默认角色被修改，可能导致kubelet无法工作<br>

kube-apiserver预定义RBAC
--------------------
|默认的clusterrole|默认的clusterrolebinding|描述|
|---|---|---|
|cluster-admin|system:masters组|超级用户拥有对任何资源执行任何操作|
|system:kube-controller-manager|system:kube-controller-manager用户|能访问kube-controller-manager组件所需要的资源|
|system:node|system:nodes组|允许访问kubelet所需资源，包括secret读取，pod写入。|

`kubectl get clusterrole -l kubernetes.io/bootstrapping=rbac-defaults` 查看默认集群角色

推荐方式：clusterRole + roleBinding（clusterRole定义全局权限，roleBinding将权限限制在namespace，clusterRole仅需要定义一次）
