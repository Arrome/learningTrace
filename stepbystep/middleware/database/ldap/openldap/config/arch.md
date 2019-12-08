# 配置

配置文件路径：<br>
* `/etc/openldap/slapd.conf` :主配置文件，记录根域名称、管理员名称、密码、日志、权限等相关信息(旧配置方式，兼容，但会转换为新的配置方式)
* `/var/lib/ldap/*` : (此目录下目录权限所属主和所属组必须为ldap用户可读写，否则加载slapd进程显示权限警告)数据文件存储位置可以根据需求进行调整。（为保证数据安全，建议放在存储设备上或者独立分区）
  * `/var/lib/ldap/DB_CONFIG`
* `/etc/openldap/slapd.d/*`  （新的配置方式）
* `/usr/share/openldap-servers/slapd.conf.obsolete`（或者sldap.ldif） (模板配置文件)
* `/usr/share/openldap-servers/DB_CONFIG.example` (模板数据库配置文件schema路径)
* `/etc/openldap/schema/*` schema 规范存放位置
