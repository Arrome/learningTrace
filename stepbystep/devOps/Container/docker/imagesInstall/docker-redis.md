# docker-mysql安装
方法一：pull -> run
-----------------
```
docker run -p 6379:6379 -v /home/fireworm/docker/redis/data:/data --name redis -d redis redis-server --appendonly yes
```
