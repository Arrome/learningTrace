# journalctl工具 ---CentOS-7才有的工具

Systemd 统一管理所有 Unit 的启动日志。带来的好处就是 ，可以只用journalctl一个命令，查看所有日志（内核日志和 应用日志）。<br>
日志的配置文件/etc/systemd/journald.conf

`journalctl -xe`
