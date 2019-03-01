# 备份

逻辑备份
--------
备份到文件：`mysqldump -uroot -p123456 -B xxxdatabase > database.sql`<br>
`mysqldump -uroot -p xxxdatabase xxxtablename1 xxxtablename2 > xxx.sql`

* `-B,--databases` 创建库，使用库的数据也备份下来
* `-d` 只导表结构
* `-t` 只导表数据
* `-A` 所有数据库
* `-F` 刷新切割binlog
* `-x` 锁表
* `-l` 只读锁表
* `--single-transaction` 适合innodb事务数据库备份，隔离级别REPEATABLE READ
* `--master-data[=#]` 用于不停机备份
* `--compact` 更少容量的备份（不好，用于debug）


物理备份
---------
