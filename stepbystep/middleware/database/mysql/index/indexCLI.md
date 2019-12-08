# 索引命令
建表创建索引：
```
create table student(
  id int(4) not null auto_increment,
  name char(20) not null,
  age tinyint(2) not null default '0',
  dept varchar(16) default null,
  primary key(id) ,
  key index_name(name)
);

create table student(
  id int(4) not null auto_increment,
  name char(20) not null,
  age tinyint(2) not null default '0',
  dept varchar(16) default null,
  primary key(id) ,
  index index_name(name)
);

-- 唯一索引
create table student(
  id int(4) not null auto_increment,
  name char(20) not null,
  age tinyint(2) not null default '0',
  dept varchar(16) default null,
  primary key(id) ,
  unique index_name(name)
);
```
创建索引：`create index index_xxxcolumn on xxxtable(xxxcolumn(n))`（前n列索引）
创建联合索引：`create index index_xxxcolumn1_xxxcolumn2 on xxxtable(xxxcolumn1,xxxcolumn2(n))`

创建普通索引:`alter table xxx add index index_xxx(xxxcolumn);`（xxx为索引字段）

删除索引:`alter table xxx drop index index_xxx;`（xxx为索引字段）
      或`drop index index_xxx on xxxtable;`

查询表上索引：`show index from xxxtable;`
