# 系统服务

systemd系统配置文件在：
1. /etc/systemd/system  存放系统启动的默认级别及启动的unit的软连接，优先级最高。
2. /run/systemd/system，系统执行过程中产生的服务脚本，优先级次之。
3. /usr/lib/systemd/system 存放系统上所有的启动文件。优先级最低

Systemd有很多不同类型的使用单元，主要包括：系统服务（.service）、挂载点（.mount）、sockets（.sockets）、系统设备（.device）、交换分区（.swap）、文件路径（.path）、启动目标（.target）

文件由三部分组成：
----------
######[Unit]
######[unit的类型：service target socket]
######[install]
