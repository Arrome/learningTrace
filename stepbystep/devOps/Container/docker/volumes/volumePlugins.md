# 卷插件

docker容器卷存在问题（第三方插件存在原因）：
1. 只支持本机数据卷，不能适应分布式存储
2. 缺乏对数据卷生命周期的有效管理，若未使用`docker rm -v`命令，存在悬挂数据卷。`docker volume`提供管理，并不十分完善
