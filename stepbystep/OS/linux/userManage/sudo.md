# sudo命令

> 报错:使用sudo命令时，经常性会提示出“不在 sudoers 文件中。此事将被报告”的错误信息。
  原因：当前登录的账号不在sudo权限里面，有权限的用户都在/etc/sudoers中
  解决: /etc/sudoer文件中新增`xxxusername ALL=(ALL) ALL`
