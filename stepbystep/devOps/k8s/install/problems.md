# 安装问题

* **问题**：创建RC成功,`kubectl get rc`查看current和ready都为0，`kubectl get pods`显示未创建
  **原因**：可能为**身份认证问题**
  **解决**：方法一：跳过验证，kube-apiserver启动参数KUBE_ADMISSION_CONTROL去除SecurityContextDeny,ServiceAccount（`KUBE_ADMISSION_CONTROL="--admission-control=NamespaceLifecycle,NamespaceExists,LimitRanger,ResourceQuota"`）重启kube-apiserver服务

* **问题**：初次运行容器的时候，pod一直处于ContainerCreating状态
  **原因**：`kubectl describe pod XXX`查看日志信息，一般原因为需要默认在远程仓库下载pod daemon镜像
  **解决**：1.从国内仓库下载到本地，`docker tag XXX xxx`修改为对应镜像版本信息。若使用本地镜像需要修改yaml文件，`containers.imagePullPolicy`为IfNotPresent，默认Always 2.上传到仓库
