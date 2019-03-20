# master-slave

mysql支持单向、双向、链式级联、实时、异步复制。复制过程中，一台服务器充当主服务器master，而一个或多个其他服务器充当从服务器slave

主从复制
-------
主宕机保证数据完整性：<br>

**方式一：主binlog，从执行（此为异步方式）**<br>
原理：
  1. slave服务器上执行start slave，开启主从复制开关
  2. 此时，slave服务器的IO线程会通过在master上授权的复制用户权限请求连接master服务器，并请求从指定binlog日志文件的指定位置（日志文件名称和位置就是在配置主从复制服务器时执行的`change master`命令时指定的）之后发送binlog日志内容
  3. master服务器接收到来自slave服务器的IO线程的请求后，master服务器上负责复制的IO线程根据slave服务器的IO线程请求的信息读取指定binlog日志文件指定位置之后的binlog日志信息，然后返回给slave端的IO线程。返回的信息中除了binlog日志内容外，还有本次返回日志内容后在master服务端的新的binglog文件名称以及在binlog中的下一个指定更新位置。
  4. 当slave服务器的IO线程获取到来自master服务器上IO线程发送日志内容及日志文件及位置点后，将binlog日志内容依次写入到slave端自身的RelayLog（即中继日志）文件的最末端，并将新的binlog文件名和位置记录到master-info文件中，以便下一次读取master端新binlog日志时能够告诉master服务器需要从新binlog日志的哪个文件哪个位置开始请求新的binlog日志内容
  5. slave服务器端的SQL线程会实时的检测本地relayLog中新增的日志内容，然后及时的把log文件中的内容解析成在master端曾经执行的SQL语句内容，并在自身slave服务器上按语句的顺序执行应用这些SQL语句，应用完毕后清理应用过的日志

**方式二：双写（压力大）**<br>
**方式三：应用程序写一定时间的log，根据log进行恢复**<br>
**方式四：异步改实时同步，插件支持**<br>

读写分离
---------


根据业务拆分从库
---------------
