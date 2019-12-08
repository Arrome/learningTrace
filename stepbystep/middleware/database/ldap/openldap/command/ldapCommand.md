# ldap


ldapadd
--------

ldapdelete
---------


ldapmodify
----------
修改


ldapsearch
---------
查询目录树条目，会通过/etc/openldap/ldap.conf配置文件读取base和url查询进行查询。（默认没有配置这两项，需要添加base和url）<br>
`ldapsearch -x -LLL` 查看当前目录树结构,配置上面否则报错`No such object (32)`<br>


ldapwhoami
-----------
验证openldap目录树条目

ldapmodrdn
----------
修改openldap目录树DN跳湖

ldapcompare
--------
判断DN值和指定参数值是否属于同一个条目

ldappasswd
----------
修改openldap目录树用户条目实现密码重置
