# 数据库读写分离

read-only参数可以让slave服务器只允许来自slave服务器线程或具有SUPRE权限的用户更新<br>
```
[mysqld]
read-only
```
