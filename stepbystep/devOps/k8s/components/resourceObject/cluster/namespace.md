# namespace 集群环境共享与隔离

通过**命名空间namespace和运行环境context**设置对不同工作组分区。<br>

namespace
----------
初始化三个namespace:
1. default:所有未指定Namespace的对象都会被分配到default命名空间
2. kube-system:所有由K8S系统创建的资源都处于这个命名空间
3. kube-public:此命名空间下资源可以被所有人访问(包括未认证用户)

例如：`kubectl --namespace=default get pods`

context
-------------------
* 绑定namespace到特定context：`kubectl config set-context <context_name> --namespace=<namespace_name>`
* 设置当前运行环境：`kubectl config use-context <context_name>`
* 查看已定义的context内容（保存在`${HOME}/.kube`目录下一个名为config的文件，可手工修改配置）:`kubectl config view`

所属namespace的资源对象
---------------------
查看所在namespace的资源对象：`kubectl api-resources --namespaced=true`<br>
查看不在namespace的资源对象：`kubectl api-resources --namespaced=false`
