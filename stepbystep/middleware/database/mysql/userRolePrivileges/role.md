# 角色

保存在mysql.user表中<br>

* 创建用户角色：<br>
`CREATE ROLE IF NOT EXISTS 'crm_dev','crm_read'@localhost,'crm_write'@'%';`(省略主机部分，默认为'%',表示任何主机)

* 授予角色权限：<br>
`GRANT ALL ON crmdb.* TO 'crm_dev';`<br>
`GRANT SELECT ON crmdb.* TO 'crm_read';`<br>
`GRANT INSERT,UPDATE,DELETE ON crm.* TO 'crm_write';`<br>

* 给用户分配角色<br>
`GRANT 'crm_dev' TO 'crm_dev1'@'localhost';`<br>
`GRANT 'crm_read' TO 'crm_read1'@'localhost';`<br>
`GRANT 'crm_read','crm_write' TO 'crm_write1'@'localhost','crm_write2'@'localhost';`（注意两个用户同时授予两个角色）

* 验证角色分配:<br>
`SHOW GRANTS FOR 'crm_dev1'@'localhost';` 只显示授予角色
`SHOW GRANTS FOR 'crm_dev1'@'localhost' USING 'read'` 同时显示授予角色的权限


* 删除角色:`DROP ROLE xxx`
--------------------------------

**用户授予角色后，当用户连接数据库服务时，不会自动使角色变为活动状态,`select current_role()`为NONE**<br>
用户连接数据库时，需要指定哪些角色处于活动状态:`SET DEFAULT ROLE ALL TO 'crm_read1'@'localhost'`

设置活动角色：<br>
`SET ROLE NONE`<br>
`SET ROLE ALL`将活动角色设置为所有授予的角色<br>
`SET ROLE DEFAULT`将活动角色设置默认角色
`SET ROLE xxx`设置活动角色
