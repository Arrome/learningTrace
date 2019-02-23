# ConfigMap 配置中心功能

cluster级别<br>
明文方式

配置容器化应用方式：
1. 自定义命令行参数：`args: []`
2. 配置文件直接打入镜像
3. 环境变量：
  * Cloud Native的应用程序一般可直接通过环境变量env加载配置`configMapKeyRef`（在启动时有效使用，edit configMap不能更改）
  * 通过entrypoint脚本预处理变量为配置文件中的配置信息
4. 存储卷
