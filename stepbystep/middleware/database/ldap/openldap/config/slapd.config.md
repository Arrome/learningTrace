# 配置

server配置文件位于 /etc/openldap/slapd.d/ <br>

开始配置需要更新变量（在 `/etc/openldap/slapd.d/cn=config/olcDatabase={2}hdb.ldif` 文件中更新，**不要手动编辑更新，每次运行ldapmodify命令都会丢失更改**，建议单独配置文件）：<br>
* olcSuffix : 数据库后缀，LDAP服务器提供信息的域名
* olcRootDN : 具有对LDAP执行所有管理活动的无限制访问权限的用户根专有名称条目(DN),如root用户
* olcRootPW : RootDN的LDAP管理员密码

DB配置
-------
```
# cat db.ldif
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
# 此处 `dc`更改为自己的域名
olcSuffix: dc=company,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
# 此处`cn`:为管理用户、`dc`都更改为自己的配置
olcRootDN: cn=manager,dc=company,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
# ldap
olcRootPW: {SSHA}g7H41iU2NTh083wGUo1pIGBSpaq9hdH6
```
`ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif`<br>

设置数据库文件
-----------
数据库配置文件拷贝到/var/lib/ldap <br>
`cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG`<br>
`chown ldap:ldap /var/lib/ldap/*`

添加cosine nis模块
---------------
`ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif`<br>
`ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif`<br>
`ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif`<br>

监控
-----
```
# cat monitor.ldif
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth" read by dn.base="cn=manager,dc=company,dc=com" read by * none
```
`ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif`<br>

启动日志记录
---------
配置rsyslog将事件记录到日志文件<br>
```
#cat /etc/rsyslog.conf
local4.* /var/log/ldap.log
```
`systemctl restart rsyslog`

构建目录结构
---------
```
# cat base.ldif
dn: dc=company,dc=com
dc: company
objectClass: top
objectClass: domain

dn: cn=manager,dc=company,dc=com
objectClass: organizationalRole
cn: manager
description: LDAP Manager

dn: ou=People,dc=company,dc=com
objectClass: organizationalUnit
ou: People

dn: ou=Group,dc=company,dc=com
objectClass: organizationalUnit
ou: Group
```
`ldapadd -x -W -D "cn=manager,dc=company,dc=com" -f base.ldif`<br>

创建用户
-------
```
# cat arrome.ldif
dn: uid=arrome,ou=People,dc=company,dc=com
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: arrome
uid: arrome
uidNumber: 9999
gidNumber: 100
homeDirectory: /home/arrome
loginShell: /bin/bash
gecos: arrome [Admin (at) arrome]
userPassword: {crypt}x
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
```
`ldapadd -x -W -D "cn=manager,dc=company,dc=com" -f arrome.ldif`<br>

为用户分配密码
---------
`ldappasswd -s 312624 -W -D "cn=manager,dc=company,dc=com" -x "uid=arrome,ou=People,dc=company,dc=com"`

验证entry
-------
`ldapsearch -x cn=arrome -b dc=company,dc=com`
