# docker-compose安装
Python语言开发

一个用户定义和运行多个容器的 Docker 应用程序，使用 YAML 文件来配置应用服务

安装
--------
```
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
基本流程
------

1. 在 Dockfile 中定义应用环境，使其可以在任何地方复制。
2. 在 docker-compose.yml 中定义组成应用程序的服务，以便它们可以在隔离的环境中一起运行。
3. 运行`docker-compose up`，Compose 将启动并运行整个应用程序。
