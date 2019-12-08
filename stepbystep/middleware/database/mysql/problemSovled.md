#常用问题及报错记录

1. 访问mysql8.0.11报错：Unable to load authentication plugin 'caching_sha2_password'<br>
分析：访问的用户配置认证caching_sha2_password，而客户端访问不支持这种认证方式<br>
解决：
```
mysql> ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
```

2. `Mysql错误:Ignoring query to other database解决方法`
解决：没有指明 用户`mysql -uroot -p`

3. java项目`java.sql.SQLException: java.lang.ClassCastException: java.math.BigInteger cannot be cast to java.lang.Long`
解决：mysql驱动和mysql数据库不对等，mysql-connector-java-5.1.21改成mysql-connector-java-5.1.46
