#常用问题及报错记录

1. 访问mysql8.0.11报错：Unable to load authentication plugin 'caching_sha2_password'<br>
分析：访问的用户配置认证caching_sha2_password，而客户端访问不支持这种认证方式<br>
解决：
```
mysql> ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
```