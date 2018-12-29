# 系统服务管理器指令 systemctl
实际上将 service（控制系统服务的实用工具） 和 chkconfig（检查、设置系统的各种服务） 这两个命令组合到一起。<br>

systemd（system daemon，linux下一种init软件） 是一个 系统管理守护进程、工具和库的集合，用于集中管理和配置类UNIX系统
systemctl命令工具 是一个 systemd 工具，主要负责控制 systemd 系统和服务管理器

`systemctl is-enabled servername.server` 查看是否是开机启动
`systemctl enable servername.server` 设置开机启动
`systemctl disable servername.server` 设置关闭开机启动

> `systemctl daemon-reload` 对于新创建的unit文件或修改了的unit文件，要通知systemd重载此配置文件
