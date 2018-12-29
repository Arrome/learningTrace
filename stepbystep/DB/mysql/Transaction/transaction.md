# 事务

默认情况，每执行一条SQL语句，都是一个单独的事务且都是自动提交的。<br>

多条SQL语句组成事务，`BEGIN`或`START TRANSACTION`开启事务，`commit`或`rollback`结束事务
