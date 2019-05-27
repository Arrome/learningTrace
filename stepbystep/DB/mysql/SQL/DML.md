# DML(select,insert,delete,update)

查看当前数据库：<br>
`select database();`<br>
查看当前用户：<br>
`select user();`<br>

插入表数据：
---------------
`insert into xxxtable(xxxcolumn1,xxxcolumn2) values(xxx1,xxx2),(xxx3,xxx4);`<br>
* `insert into config_info(id,data_id,content) values (1, "name","name") on duplicate key update id=3,content="test";` 尝试insert，若存在(通过判断唯一索引Unique和主键primaryKey)则更新字段。同时存在唯一索引和主键，则第一条生效<br>
* `replace into config_info(id,data_id) values (1,"gggg");` 尝试insert，若存在(通过判断唯一索引Unique和主键primaryKey)则先删除行，再insert，若如上冲突，会删掉匹配的多条数据。（关联主键会遭到破坏，造成影响）

更新表数据：
`update xxxtable set xxxcolumn=xxx where xxxcolumn1 = xxx;`(注意更新条件，防止误删：`mysql -U`默认必须指定where语句才能操作)

删除表数据：
`delete from xxxtable where xxxcolumn = xxx;`<br>
`truncate table xxxtable;`<br>
