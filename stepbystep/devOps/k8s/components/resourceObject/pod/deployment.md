# deployment

**目的**：视为RC的升级，更好解决Pod编排问题,相对于RC可以随时知道当前Pod部署进度<br>
**典型应用场景**：
* 创建一个Deployment对象来**生成对应的Replica Set并完成Pod副本的创建过程**,管理多个ReplicaSet
* 检查Deployment的状态来看部署动作是否完成
* 更新Deployment以创建新的Pod（如镜像升级）
* 如果当前Deployment不稳定，回滚到一个早先的Deployment版本
* 挂起或者恢复一个Deployment

> annotation记录更改历史，保存replicaSet，方便回滚

回滚命令
----
`kubectl rollout history`
