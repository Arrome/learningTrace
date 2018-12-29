# /etc/passwd 文件

用户登录时校验用户的口令。仅对root用户可写<br>

1. 系统管理员：root
2. 系统用户：bin, daemon, adm, nobody 等等<br>
3. 普通用户：

**格式**：<br>
LOGNAME:PASSWORD:UID:GID:USERINFO:HOME:SHELL

######UID
  * 系统管理员 UID (0)
  * 系统保留 UID (1~499)
    * 由distributions自行建立的系统帐号(1~99)
    * 若用户有系统帐号需求时，可以使用帐号UID(100~499)
  * 一般可登陆帐号(500~65535)

查看用户命令：`awk -F ':' '{if($3<500){print $1,"系统用户"}else{print $1,"普通用户"}}' /etc/passwd`

####命令 passwd
