# pod集群配置管理方案--ConfigMap

**目的**：配置信息与程序分离<br>
**通过环境变量或外挂文件方式在创建容器时进行配置注入**,key:value形式保存<br>

ConfigMap供容器使用场景：
1. 生成容器内环境变量
2. 设置容器启动命令的启动参数（设为环境变量）
3. 以Volume形式挂载为容器内部文件和目录

ConfigMap使用方式（创建Pod时，如何引用configMap）：
1. 环境变量方式，Containers的env.valueFrom.configMapKeyRef
2. volumeMount方式，volumeMounts挂载volume.configMap(items指定key，value)
