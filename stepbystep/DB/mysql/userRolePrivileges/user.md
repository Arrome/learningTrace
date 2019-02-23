# 用户user

用户登录认证插件：
--------------
authentication plugin: `'caching_sha2_password','mysql_native_password'`<br>

用户操作
-------
* 创建用户(**只有连接数据库的权限**，需要后续继续授权)：<br>
`CREATE USER 'fireworm'@'%' IDENTIFIED BY "123456";`
* 删除用户：<br>
`DROP USER 'fireworm'@'%';`
* 修改用户密码：<br>
`set password for 'fireworm'@'%' = '123456';` <br>
或者 `mysqladmin -uroot -p123456 password 123`

Problems
--------
* **登录报错**：<br>
  `Error connecting to database: Authentication plugin 'caching_sha2_password' cannot be loaded: /usr/lib64/mysql/plugin/caching_sha2_password.so: cannot open shared object file: No such file or directory`<br>
 **解决**：<br>
  `ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456'`<br>
  或者 /etc/my.cnf文件增加`default-authentication-plugin=mysql_native_password`

* **远程用户无法连接**：修改用户HOST：`localhost`-->远程IP或者`%`
