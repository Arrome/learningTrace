# 虚拟主机

特殊软硬件技术，将网络上每一台计算机分成多个虚拟主机，**每个虚拟主机独立对外提供www服务，实现一台主机对外提供多个web服务**。

> 配置多个域名虚拟主机，IP地址访问，默认返回使用第一个虚拟主机

基于域名的虚拟主机
--------------
创建目录/root/html,配置：
```
http {
  server {
     listen 80;
     server_name www.nginx01.com;
     location / {   #所有请求以/开头，匹配所有请求
        root /root/html; #虚拟主机默认物理根目录
        index index.html; #虚拟主机默认首页
     }
  }
}
```
server_name格式(优先级由高到低)：
1. 准确名称：`www.nginx01.com`
2. `*`开头：`*.nginx01.com`
3. `*`结尾：`mail.*`
4. 正则表达式：必须以`~`开头，`server_name ~^www\d+\.test\.com$`

基于端口的虚拟主机
----------------
```
server {
  listen 8080
}
```


基于IP的虚拟主机
--------------
```
server {
  listen 192.168.186.128:8080
}
```
