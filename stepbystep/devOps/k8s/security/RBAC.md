# RBAC 基于角色访问控制

apiServer默认创建一系列ClusterRole和ClusterRoleBinding。资源对象中名称`system:xxx`,属于kubernetes系统基础设施.<br>
RBAC默认的集群角色完成足够的覆盖，让集群可以完全在RBAC管理下运行<br>
> 例如`system:node`为ClusterRole定义了kubelet进程权限。如果默认角色被修改，可能导致kubelet无法工作<br>

kube-apiserver预定义RBAC
--------------------
* **名为cluster-admin的clusterRoleBinding将组system:masters与名为cluster-admin的clusterRole绑定**，使其cluster-admin拥有kube-apiserver的所有权限，作为超级管理员
* **名为system:kube-controller-manager的clusterRoleBinding将用户system:kube-controller-manager与名为system:kube-controller-manager的clusterRole绑定**

`kubectl get clusterrole -l kubernetes.io/bootstrapping=rbac-defaults` 查看默认集群角色

推荐方式：clusterRole + roleBinding（clusterRole定义全局权限，roleBinding将权限限制在namespace，clusterRole仅需要定义一次）
