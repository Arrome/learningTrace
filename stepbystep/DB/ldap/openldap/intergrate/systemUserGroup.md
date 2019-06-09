# 系统用户及用户组

migrationtools 工具通过查找/etc/passwd、/etc/shadow、/etc/groups 生成ldif文件并通过ldapadd命令更新数据库数据,完成用户添加<br>

```
[root@localhost ~]# rpm -ql migrationtools
/usr/share/doc/migrationtools-47
/usr/share/doc/migrationtools-47/README
/usr/share/doc/migrationtools-47/migration-tools.txt
/usr/share/migrationtools
/usr/share/migrationtools/migrate_aliases.pl
/usr/share/migrationtools/migrate_all_netinfo_offline.sh
/usr/share/migrationtools/migrate_all_netinfo_online.sh
/usr/share/migrationtools/migrate_all_nis_offline.sh
/usr/share/migrationtools/migrate_all_nis_online.sh
/usr/share/migrationtools/migrate_all_nisplus_offline.sh
/usr/share/migrationtools/migrate_all_nisplus_online.sh
/usr/share/migrationtools/migrate_all_offline.sh
/usr/share/migrationtools/migrate_all_online.sh
/usr/share/migrationtools/migrate_automount.pl
/usr/share/migrationtools/migrate_base.pl
/usr/share/migrationtools/migrate_common.ph
/usr/share/migrationtools/migrate_fstab.pl
/usr/share/migrationtools/migrate_group.pl
/usr/share/migrationtools/migrate_hosts.pl
/usr/share/migrationtools/migrate_netgroup.pl
/usr/share/migrationtools/migrate_netgroup_byhost.pl
/usr/share/migrationtools/migrate_netgroup_byuser.pl
/usr/share/migrationtools/migrate_networks.pl
/usr/share/migrationtools/migrate_passwd.pl
/usr/share/migrationtools/migrate_profile.pl
/usr/share/migrationtools/migrate_protocols.pl
/usr/share/migrationtools/migrate_rpc.pl
/usr/share/migrationtools/migrate_services.pl
/usr/share/migrationtools/migrate_slapd_conf.pl
```

1. 安装工具：`yum install -y migrationtools`<br>
2. 创建根域目录：`/usr/share/migrationtools/migrate_base.pl  > migrate_base.ldif`<br>
3. 配置文件`/usr/share/migrationtools/migrate_common.ph`
```
# Default DNS domain
$DEFAULT_MAIL_DOMAIN = "padl.com";

# Default base
$DEFAULT_BASE = "dc=padl,dc=com";
```
4. 生成用户和用户组ldif文件
```
tail -n5 /etc/passwd > system
/usr/share/migrationtools/migrate_passwd.pl system people.ldif
tail -n5 /etc/group > group
/usr/share/migrationtools/migrate_group.pl group group.ldif
```
5. ldapadd 导入模板文件内容
```
ldapadd -x -W -D "cn=manager,dc=company,dc=com" -f migrate_base.ldif
ldapadd -x -W -D "cn=manager,dc=company,dc=com" -f people.ldif
ldapadd -x -W -D "cn=manager,dc=company,dc=com" -f group.ldif
```
