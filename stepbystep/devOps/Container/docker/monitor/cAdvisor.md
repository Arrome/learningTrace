# cAdvisor

google开发<br>
优点：<br>
* 展示Host和Container两个层次监控数据
* 展示历史变化数据
* 可将数据导出到第三方工具（作为监控数据收集器，收集导出数据）
缺点:<br>
* 界面简单，只能监控一个Host

安装
---------
`docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest`<br>

访问地址：`http://[HostIP]:8080`
