# DDL(create,alter,drop)

创建，删除 数据库
-------
```
CREATE DATABASE test_db DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE test_db DEFAULT CHARACTER SET gbk COLLATE gbk_general_ci;

drop database xxx;
```
创建表
-------
```
create table xxx(
  xxx xxx,
  xxx xxx
  ) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;
```

修改表名：
----
`rename table xxx to xxx;`<br>
或`alter table xxx rename to xxx;`


修改表字段
----------
`alter table xxxtable add xxxcolumn varchar(16) after xxxcolumn1;`(只有after，没有before)<br>
`alter table xxxtable add xxxcolumn varchar(16) first;`
