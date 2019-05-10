#docker-mysql安装
方法一：pull -> run
-----------------
```
1. docker search mysql
2. docker pull mysql
3. docker run -p 3306:3306 --name mysql -v /home/fireworm/docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
```

注意：docker启动后，宿主机不能访问，而在docker内可以通过mysql客户端访问服务<br>

方法二：dockerfile
-----------------

问题记录：
-----------------
1. mysql只能本地连接，不能远程连接：<br>
  为用户授权远程连接。(为了用户的安全，**系统默认的设置是不允许远程用户连接**，只能本地连接)

2. `chown: cannot read directory '/var/lib/mysql/': Permission denied`
docker run时加上`--privileged=true`
