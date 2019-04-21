# 用户管理

新增用户
-------
useradd 命令使用系统默认值（/etc/default/useradd），以及命令行参数来设置用户帐号。

> 如果主目录已经存在，就不再创建，但是此主目录虽然作为新用户的主目录，而且默认登录时会进入这个目录下，但是这个目录并不是属于新用户，当使用userdel删除新用户时，并不会删除这个主目录，因为这个主目录在创建前已经存在且并不属于这个用户。

`useradd -D` 查看默认设置：
1. GROUP=100 ： 新用户会被添加到GID为100的公共组
2. HOME=/home ： 新用户的HOME目录将会位于/home/loginname
3. INACTIVE=-1 : 新用户密码在过期后不会被禁用
4. EXPIRE=     ： 新用户未被设置过期日期
5. SHELL=/bin/bash ： 新用户将bash shell作为默认shell
6. SKEL=/etc/skel ： 系统会将/etc/skel目录下内容（bash shell标准启动文件）复制到用户的HOME目录下
7. CREATE_MAIL_SPOOL=yes : 系统为该用户在mail目录下创建一个用于接收邮件的文件

`useradd -D -s /bin/tsch` 通过useradd -D跟上指定值修改系统默认新用户设置

删除用户
--------
userdel 命令默认只删除/etc/passwd文件中用户信息，而不会删除系统中属于该账户的任何文件<br>
`userdel -r`删除用户HOME目录以及邮件目录，系统上仍可能存在已删除用户的其他文件，有些环境会造成问题（小心操作，以免HOME目录下存放了其他用户或其他程序的重要文件）


修改用户
---------
1. `usermod` 能修改/etc/passwd文件中大部分字段，-L选项锁定账户使用户无法登陆（无需删除账户和数据），-U解除锁定恢复使用
2. `passwd` 修改密码，-e强制用户下次登陆时修改密码<br>
   chpasswd 为大量用户修改密码，可以从标准输入自动读取登陆名和密码对（冒号分割），对密码加密。例如：`chpasswd < users.txt`
3. `chfn,chsh,chage chfn`命令在/etc/passwd文件备注字段存储信息，chsh命令修改默认用户的登陆shell，chage命令管理账户有效期
