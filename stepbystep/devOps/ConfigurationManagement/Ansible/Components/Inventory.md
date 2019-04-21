# inventory

一般用来定义远端主机认证信息（SSH登陆密码，用户名，key相关信息等），支持主机和主机组便利定义。<br>

默认配置在配置文件中，指向/etc/ansible/hosts，可通过ANSIBLE_HOSTS环境变量指定或运行ansible和ansible-playbook用 -i 参数临时设定<br>
**支持多个Inventory文件**，方便管理不同业务或不同环境中的机器<br>
**支持动态Inventory**，从CMDB系统和Zabbix监控系统拉取所有主机信息，使用Ansible进行管理。只需要在ansible.cfg文件中inventory改成一个执行脚本。脚本不限语言，但参数有规范，结果有要求：1. --list或-l，这个参数运行后会显示所有主机以及主机组的信息（JSON格式）2. --host或-H，参数后跟指定host，返回主机所有信息（JSON格式）

`ansible xxx[hostId/hostgroup] -m ping -u xxx[username]` 测试连通

Inventory 内置参数
-------------

|参数|含义|例子|
|---|----|----|
|ansible_ssh_host|定义 hosts ssh主机||
|ansible_ssh_port|定义 hosts ssh端口||
|ansible_ssh_user|定义 hosts ssh用户||
|ansible_ssh_pass|定义 hosts ssh密码||
|ansible_sudo|定义 hosts sudo用户||
|ansible_sudo_pass|定义 hosts sudo密码||
|ansible_sudo_exe|定义hosts sudo路径|ansible_sudo_exe=/usr/bin/sudo|
|ansible_connection|定义hosts连接方式|ansible_connection=local|
|ansible_ssh_private_key_file|定义hosts私钥|ansible_ssh_private_key_file=/root/key|
|ansible_shell_type|定义hosts shell类型|ansible_shell_type=zsh|
|ansible_python_interpreter|定义hosts任务执行python路径|ansible_python_interpreter=/usr/bin/python2.6|
|ansible_*_interpreter|定义hosts其他语言解析器路径|ansible_ruby_interpreter=/usr/bin/ruby|
