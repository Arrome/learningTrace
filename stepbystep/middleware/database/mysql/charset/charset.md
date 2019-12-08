# 字符集

客户端
---------
**临时生效**设置客户端编码为utf8：<br>
`set names utf8`<br>
`mysql --default-character-set < xxx.sql`

永久设置，在my.cnf
```
[client]
default-character-set=utf8mb4
```

服务端
----------
在my.cnf文件配置
```
[mysqld]
character_set_server=utf8mb4
```

`show variables like 'character_set%';`查看：<br>
* 客户端字符集：`character_set_client`,`character_set_connection`,`character_set_results`（mysql不指定，默认和系统字符集保持一致）<br>
* 服务器字符集：`character_set_database`,`character_set_server`

两条命令都没有更新已有记录的字符集，而只是对新创建的表或者记录生效：<br>
`alter database xxxdatabasename character set xxx`<br>
`alter table xxxtablename character set xxx`
