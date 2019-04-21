# 调度

调度算法
---------

1. 轮询round-robin(默认方式)
  * 适用后台服务器性能一致
  * **挂掉机器可以自动从服务列表剔除**
2. 权重weight（加权轮询）
  * 首先将请求都分给高权重的机器，直到机器的权值降低到比其他机器低，才开始讲请求分给下一个高权重的机器，适用于后台服务器性能不均
```
upstream backend {    
  server 192.168.0.xxx weight=10;    
  server 192.168.0.xxx weight=10;    
}
```
3. ip_hash
  * 根据请求者IP的hash值将请求发送到后台服务器，保证来自同一ip请求被打到固定的机器上，以解决session问题
```
  upstream backend {    
  ip_hash;    
  server 192.168.0.xxx:88;    
  server 192.168.0.xxx:80;    
  }
```
4. url_hash(第三方)
  * 根据请求url的hash值将请求分发
```
upstream backend {    
  server squid1:3128;    
  server squid2:3128;    
  hash $request_uri;    
  hash_method crc32;    
}
```
> 在upstream中加入hash语句，**server语句中不能写入weight等其他的参数**，hash_method是使用的hash算法

5. fair(第三方)
  * 根据后台响应时间来分发请求，响应时间短的分发请求多
```
  upstream backend {    
  server server1;    
  server server2;    
  fair;    
}
```

服务器分类
-------
动静分离：1. 目录 2. 扩展名
客户端设备分类（android/ios/PC）
