#redis适用场景及实现

缓存
----------
  * 利用每个键设置生存时间(Time To Live,TTL),到期自动删除<br>
    * `expire`和`ttl` 命令实现：<br>
      * `expire` 指定最小单位：秒
      * `ttl`返回结果-1表示永久保存（默认），-2表示键不存在<br>
    * `persist`命令恢复永久保存
    > `pexpire`和`pttl` 指定最小单位：毫秒<br>
  * 可限定数据占用的最大内存空间，数据达到限制后按一定规则自动淘汰不需要的键(**通过redis.conf配置文件**)

队列（高性能优先级队列）
--------------
  * 列表类型，支持阻塞式读取(`brpop`,`blpop`命令检测键，如果没有元素就阻塞列表)
  * 优先级任务队列（`brpop`,`blpop`命令检测多个键，如果都有元素则按照从左到右顺序取第一个键中的一个元素）

消息模式“发布订阅”<br>
-------------------
  `publish channel message` `subscribe channel` 命令<br>
  `psubscribe` `punsubscribe`按照规则订阅，规则支持glob风格通配符格式
  > **执行 SUBSCRIBE 命令后客户端会进入订阅状态,处于此状态下客户端不能使用除SUBSCRIBE、UNSUBSCRIBE、PSUBSCRIBE和PUNSUBSCRIBE这4个属于“发布/订阅”模式的命令之外的命令,否则会报错。**
