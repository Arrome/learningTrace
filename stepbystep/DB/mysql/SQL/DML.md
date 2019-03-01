# DML(select,insert,delete,update)

查看当前数据库：<br>
`select database();`<br>
查看当前用户：<br>
`select user();`<br>

插入表数据：
`insert into xxxtable(xxxcolumn1,xxxcolumn2) values(xxx1,xxx2),(xxx3,xxx4);`

更新表数据：
`update xxxtable set xxxcolumn=xxx where xxxcolumn1 = xxx;`(注意更新条件，防止误删：`mysql -U`默认必须指定where语句才能操作)

删除表数据：
`delete from xxxtable where xxxcolumn = xxx;`<br>
`truncate table xxxtable;`<br>
