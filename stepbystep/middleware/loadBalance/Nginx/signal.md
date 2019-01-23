# signal 控制信号

master process处理信号：

|信号|含义|
|----|----|
|TERM,INT|快速关闭|
|QUIT|从容关闭|
|HUP|重载配置，用新的配置开始新的工作进程，从容关闭旧的工作进程|
|USR1|重新打开日志文件(写入新的日志文件，改名无效，会写到同一inode文件里)|
|USR2|平滑升级可执行程序|
|WINCH|从容关闭工作进程|

worker process支持信号（不必操作worker process）:

|信号|含义|
|----|----|
|TERM,INT|快速关闭|
|QUIT|从容关闭|
|USR1|重新打开日志文件|

nginx停止进程：
-------------
```
ps -ef|grep nginx
kill -signalType(QUIT|TERM|...) nginx-PID
kill -signalType(QUIT|TERM|...) `cat /usr/local/nginx/nginx.pid`
kill -9 nginx-PID
```

nginx重启进程
----------
1. 先关闭进程，修改配置，重新启动
2. 重新加载配置文件，不重启进程，不会停止处理请求:<br>
  nginx接收HUP信号，尝试解析配置文件，成功则应用新配置。之后nginx运行新的工作进程并从容关闭旧的工作进程。**通知工作进程关闭监听套接字但是继续为当前连接的客户提供服务。所有客户端的服务完成后，旧的工作进程被关闭。**若应用失败，继续使用旧的配置进行工作
3. 平滑更新nginx二进制，不会停止处理请求<br>
  `kill -USR2 nginx-PID`主进程将重命名其pid文件为oldbin，然后执行新的可执行程序，依次启动新的主进程和新的工作进程
