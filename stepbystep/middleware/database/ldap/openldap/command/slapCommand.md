# slap命令

启动默认监听端口389

slapd
------
`slapd -d ?` 获取日志级别<br>

slappasswd
----------

slaptest
--------
对slapd.conf配置文件的语法检测<br>
`slaptest -u -f /etc/openldap/slapd.conf`<br>
`slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d` 通过slapd.conf配置文件生成数据库<br>

slapindex
----------
创建openldap目录树索引，提高查询效率

slapcat
--------
将数据条目转换为openldap的ldif文件
