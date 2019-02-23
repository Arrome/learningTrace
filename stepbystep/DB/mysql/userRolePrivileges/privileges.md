#权限

1.分配权限
--------------
为了用户的安全，**系统默认的设置是不允许远程用户连接**，只能本地的用户连接（mysql.user表HOST字段localhost）
```
mysql> grant all privileges on *.* to 'root'@'%' identified by '123456' with grant option;

分配当前所在用户不需要identified，否则报语法错：
mysql> grant all privileges on *.* to 'root'@'%';
```
* all privileges：表示将所有权限授予给用户。也可指定具体的权限，如：SELECT、CREATE、DROP等。
* on：表示这些权限对哪些数据库和表生效，格式：数据库名.表名，这里写“*”表示所有数据库，所有表。如果我要指定将权限应用到test库的user表中，可以这么写：test.user
* to：将权限授予哪个用户。格式："用户名"@"登录IP或域名"。%表示没有限制，在任何主机都可以登录。比如："yangxin"@"192.168.0.%"，表示yangxin这个用户只能在192.168.0的IP段登录
* identified by：指定用户的登录密码
* with grant option：表示允许用户将自己的权限授权给其它用户

2.刷新权限
-----------
用户权限变更后，需要重新加载权限，内存中写入数据库
```
mysql> flush privileges;
```

3.查看权限
------------
```
mysql> show grants for 'root'@'localhost';
```
4.回收权限
---------------
```
mysql> revoke create on *.* from 'user@localhost';
mysql> flush privileges;
```

5. 将一用户权限分配给另一用户<br>
`GRANT 'user1@localhost' TO 'user2@localhost'`
