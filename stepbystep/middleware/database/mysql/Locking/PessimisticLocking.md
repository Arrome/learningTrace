# 悲观锁
**解决多个事务丢失更新问题**<br>
**缺点**：依赖数据库锁机制，加锁时间过长影响并发访问，性能开销大
假设丢失更新一定会发生<br>
共享锁：`select ... lock in share mode`<br>
排他锁：`select ... for update`
