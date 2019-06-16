# weave scope

优点：<br>
* 自动生成一张Docker host地图（默认显示Host当前运行的容器，不包括weave相关容器）
* 多主机监控

安装
-----
`curl -L git.io/scope -o /usr/local/bin/scope chmod a+x`<br>
`/usr/local/bin/scope scope launch` 容器方式启动weave scope <br>

访问地址：`http://[HostIP]:4040`


多主机监控
------
在多个host上都执行`scope launch HostIP1 HostIP2`,在其上都可以访问地址，监控多个Host<br>
