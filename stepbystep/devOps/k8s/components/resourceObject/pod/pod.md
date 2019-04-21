# pod

pod大部分场景只是容器的载体，**通常需要通过RC、Deployment、DaemonSet、Job等对象完成Pod的调度与自动控制功能**<br>

k8s为每个pod都附属了一个k8s.gcr.io/pause:latest（默认从远程仓库`https://k8s.gcr.io/v2/`下载，需要下载或配置本地仓库地址）<br>
**此容器只接管Pod的网络信息，业务容器通过加入网络容器的网络来实现网络共享。此容器随着pod创建而创建，随着Pod删除而删除**<br>

pod里的多个业务容器共享网络和文件系统(即pod的IP和数据卷)<br>

Static Pod
-------------
**完全直接由节点kubelet程序管理监控**(没有apiserver介入，不关联任何RC),当kubelet发现静态Pod停止时，重新启动静态Pod<br>
静态Pod启动方式:<br>
1. kubelet启动参数`--pod-manifest-path`指定监控的配置文件，定期扫描该目录<br>
2. kubelet启动参数`--manifest-url`，定期从该url下载pod定义文件

`kubectl get po`可以查看，`kubectl delete pod `删除后，pending状态，但并未删除，要删除操作kubelet对应的目录文件<br>


pod健康检查
-----------
* livenessProbe探针：判断容器存活与否
  * ExecAction：在容器内部执行一个命令，如果该命令返回码为0，表示容器健康
  * TCPSocketAction：通过容器IP地址和端口号执行TCP检查，如果能建立TCP连接，表示容器健康
  * HTTPGetAction：通过容器IP地址和端口号及路径调用HTTP Get方法，如果响应的状态码大于等于200且小于400，则认定容器状态健康
* ReadinessProbe探针：判断容器是否启动完成（ready状态）可以接收请求

延迟时间和超时时间设置：
* initialDelaySeconds：启动容器后进行首次健康检查的等待时间，单位：秒
* timeoutSeconds：健康检查发送请求后等待响应的超时时间，单位：秒

Pod启动前后钩子
------
`pods.spec.containers.lifecycle.postStart` <br>
`pods.spec.containers.lifecycle.preStop`
