# Docker服务架构

C/S架构
-----------

Docker服务端默认监听本地的 unix:///var/run/docker.sock 套接字，只允许本地的root用户访问。
> 可通过 -H 选项来修改监听的方式
例如：服务端监听本地TCP连接1234端口：`docker -H 0.0.0.0:1234 -d`<br>
> Ubuntu系统中，Docker服务器默认启动配置文件在/etc/default/docker


docker client
----------------



docker daemon
--------------
作用：<br>
* docker server接收并调度分发docker-client发送的请求<br>
(docker daemon运行时，后台启动一个server，负责接收client发送的请求，server通过路由与分发调度找到相应的Handler处理请求)<br>
* 管理所有的docker容器
