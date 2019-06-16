# sysdig

轻量级的系统监控工具，原生支持容器。工具集成（strace、tcpdump、htop、iftop、lsof...）<br>

优点：<br>
* 监控信息全，包括linux操作系统和容器
* 界面交互性强
缺点：<br>
* 命令方式，需要登录到主机
* 显示实时数据，看不到变化和趋势

> 内核模块有要求

安装
------
`docker run -it --rm --name=sysdig --privileged=true --volume=/var/run/docker.sock:/host/var/run/docker.sock --volume=/dev:/host/dev --volume=/proc:/host/proc:ro --volume=/boot:/host/boot:ro --volume=/lib/modules:/host/lib/modules:ro --volume=/usr:/host/usr:ro sysdig/sysdig`  <br>
`--privileged`使container读取操作系统/dev、/proc等数据，获取系统信息。<br>

进入container,执行`csysdig`命令，交互方式启动sysdig
