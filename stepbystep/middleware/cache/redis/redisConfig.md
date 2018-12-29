#redis配置

* 通过启动参数传递同名的配置选项会覆盖配置文件中相应的参数

* Redis 在位于源代码目录的根目录中,提供了一个配置文件的模板redis.conf
  * Redis 运行时**部分配置可通过`CONFIG SET`命令在不重新启动Redis的情况下动态修改部分Redis配置**，例如：`CONFIG SET loglevel warning`

redis.conf
---------

#####回收策略
* maxmemory 参数：限制redis 最大可用内存大小（单位：字节）<br>
* maxmemory-policy 参数：超过 maxmemory 限制，redis根据 maxmemory-policy 参数指定的策略来删除不需要的键直到redis占用内存小于指定内存
  * volatile-lru LRU算法删除（只对设置了过期时间的键）
  * allkeys-lru  LRU算法删除
  * volatile-random 随机删除（只对设置了过期时间的键）
  * allkeys-random  随机删除
  * volation-ttl    删除过期时间最近的一个键
  * noeviction      不删除键，只返回错误
