# mysqlbinlog 命令

binlog功能开启：<br>
/etc/my.cnf文件中配置`log-bin=mysql-bin`

`mysqlbinlog -d xxxdatatbase binlog.000001` 显示数据库binlog

按照位置截取：`mysqlbinlog binlog.000001 --start-position=365 --stop-position=456 -r pos.sql`<br>
按照时间截取：`mysqlbinlog binlog.000001 --start-datetime='2019-1-1 17:14:15' --stop-datetime='2014-10-16 17:15:15' -r time.sql`<br>
