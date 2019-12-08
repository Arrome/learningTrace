# 主从复制安装

配置master
----------
1. 配置master的`log-bin`及`server-id`(master开启binlog，slave可不开启；server_id不同)
```
[mysqld]
log-bin=/var/lib/mysql/binlog
server-id=1 #值任意，只要唯一即可
```
2. 重启mysql服务<br>
3. 建立用于从库复制的账号rep：<br>
`grant replication slave on *.* to 'rep'@'%' identified by '123456';`
4. 锁定数据库以防止写入数据(窗口关闭后即失效，超时参数到也失效)<br>
`flush tables with read lock;`
5. 导出数据库<br>
`mysqldump -u root -p 123456 --all-databases --lock-tables=false > all.sql`
6. 数据库文件拷贝到从服务器<br>
`scp all.sql root@xxx.xxx.xxx.xxx:/root`
7. 确认master状态,记录位置，配置到slave<br>
`show master status;`
8. 解锁数据表<br>
`unlock tables;`

配置slave
---------
1. 编辑my.cnf，加入`server-id`值
2. 重启mysql服务
3. 导入主服务器的数据库<br>
`mysql -uroot -p < all.sql;`
4. 登录执行命令<br>
`change master to master_host='x.x.x.x',master_user='root',master_password='123456',master_port=3306,master_log_file='binlog.000001',master_log_pos=98,master_connect_retry=10;`
5. 启动slave进程<br>
`mysql> start slave;`
6. 查看/var/log/mysqld.log日志文件验证
