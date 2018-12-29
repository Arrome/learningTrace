# Docker client 连接 docker daemon 方式

UNIX域套接字（默认方式）
-----------
**UNIX域套接字 用于本地进程间通讯**，相比网络套接字更高效
docker daemon启动，会生成一个 /var/run/docker.sock 文件
Ｄocker服务端默认监听本地的 unix:///var/run/docker.sock 套接字，**只允许本地的root用户访问**。

> Ubuntu系统中，Docker服务器默认启动配置文件在/etc/default/docker

TCP端口监听
----------
**暴露IP，port能随意访问docker服务器，危险**<br>
可通过 -Ｈ 选项来修改监听的方式<br>
服务端开启端口监听 `dockerd -H IP：port`<br>
客户端指定IP，port访问服务器 `docker -H IP：port`<br>
例如：服务端监听本地TCP连接1234端口：`docker -H 0.0.0.0:1234 -d`<br>

同时监听多个socket
-------------------
`sudo dockerd -H unix:///var/run/docker.sock -H tcp://127.0.0.1:2376 -H tcp://127.0.0.1:2377`

配置方式(文件位置依赖环境，在/etc/init/docker.conf, /etc/default/docker,/etc/default/docker.io)：`DOCKER_OPTS="-H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock"`

TLS 安全连接（客户端服务器双向认证，保证安全）
-----------
