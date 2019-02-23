#redis安装部署

安装
----
1. 下载，解压
2. make编译(C语言makefile编译)
    * make **编译后在Redis源代码目录的src文件夹中可以找
到若干个可执行程序**
    * make PREFIX=/usr/local/bin install，**安装到指定目录(目录下只有bin目录)**
3. 启动redis服务(默认连接端口6379)
    redis-server
4. 客户端连接验证
    redis-cli

* 安装成服务：
    执行源码包下src/utils/install_server.sh
* 作为linux服务随机启动：
    配置文件/etc/rc.local后追加redis-server命令  

正确停止Redis
--------
1. `redis-cli SHUTDOWN`：先断开所有客户端连接，根据配置执行持久化，最后完成退出
2. kill redis进程也正常停止


测试连接
-----
`redis-cli ping`返回`PONG`
