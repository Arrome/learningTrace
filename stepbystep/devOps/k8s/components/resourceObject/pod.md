# pod

pod大部分场景只是容器的载体，**通常需要通过RC、Deployment、DaemonSet、Job等对象完成Pod的调度与自动控制功能**<br>

k8s为每个pod都附属了一个k8s.gcr.io/pause:latest（默认从远程仓库https://k8s.gcr.io/v2/下载，需要下载或配置本地仓库地址）,**此容器只接管Pod的网络信息，业务容器通过加入网络容器的网络来实现网络共享。此容器随着pod创建而创建，随着Pod删除而删除**<br>

pod里的多个业务容器共享网络和文件系统(即pod的IP和数据卷)<br>

Static Pod
-------------
**完全直接由节点kubelet程序管理监控**(没有apiserver介入，不关联任何RC),当kubelet发现静态Pod停止时，重新启动静态Pod<br>
静态Pod启动方式:<br>
1. kubelet启动参数`--pod-manifest-path`指定监控的配置文件，定期扫描该目录<br>
2. kubelet启动参数`--manifest-url`，定期从该url下载pod定义文件

`kubectl get po`可以查看，`kubectl delete pod `删除后，pending状态，但并未删除，要删除操作kubelet对应的目录文件<br>

pod集群配置管理方案--ConfigMap
-------------
**目的**：配置信息与程序分离<br>
**通过环境变量或外挂文件方式在创建容器时进行配置注入**,key:value形式保存<br>

ConfigMap供容器使用场景：
1. 生成容器内环境变量
2. 设置容器启动命令的启动参数（设为环境变量）
3. 以Volume形式挂载为容器内部文件和目录

ConfigMap使用方式（创建Pod时，如何引用configMap）：
1. 环境变量方式，Containers的env.valueFrom.configMapKeyRef
2. volumeMount方式，volumeMounts挂载volume.configMap(items指定key，value)
