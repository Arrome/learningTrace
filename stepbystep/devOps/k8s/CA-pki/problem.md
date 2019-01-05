# problems

* kubectl 报错：`Error from server (Forbidden): pods is forbidden: User "client" cannot list resource "pods" in API group "" in the namespace "default"`<br>
解决：kubeconfig文件user.name，对应客户端证书配置文件需要配置 CN=user.name，O=xxx

* kubectl 报错：`error: You must be logged in to the server (Unauthorized)`
