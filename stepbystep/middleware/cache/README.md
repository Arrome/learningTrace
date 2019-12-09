# 提高命中率

* expires，cache-control缓存头
* 动静分离，静态化，静态走CDN
* 预取第一次命中（后端生成数据，推送到cache server）

注意：4XX，5XX错误页面，或者死链接不能缓存


一致性
----
重复使用缓存对象时，cache server需要经常从原始服务器确认