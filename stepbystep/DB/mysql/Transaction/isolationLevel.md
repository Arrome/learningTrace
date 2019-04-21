# 隔离级别
不考虑隔离性，会出现：
1. 脏读：一个事务读取到另一个事务未提交的数据<br>
  (一个事务更新数据后未提交，另一个事务能够读取到前一事务执行结果。事务回滚以后，另一个事务读取结果又改变)
2. 不可重复读：一个事务先后两次读取数据不一致，第二次读到另一个事务已经提交的数据（强调数据更新update）<br>
  （一个事务内在另一个事务提交前后读取结果不一致）
3. 幻读：一个事务中先后两次读取数据记录数不同，第二次读到另一个事务已经提交的数据（强调数据记录变化insert）

四种隔离级别
-----------
|隔离级别|脏读|不可重复读|幻读|
|-------|---|---------|---|
|read uncommitted|N|N|N|
|read committed|Y|N|N
|repeatable read|Y|Y|N|
|serializable|Y|Y|Y|

mysql 查询设置命令
------------
查询：`select @@transaction_isolation`<br>
设置：`set [session|global] transaction isolation level 隔离级别`
> 注意：旧版mysql事务<br>
查询使用: `select @@tx_isolation`<br>

事务丢失更新问题
-----
**概念**： 两个或多个事务更新同一行，事务彼此之间都不知道其他事务进行修改，后一个会覆盖前一个的修改<br>
**解决方法**：1. 悲观锁 2. 乐观锁