# 配置文件

加载配置文件顺序：
1. ANSIBLE_CONFIG:环境变量指向配置文件（大多Ansible参数可以通过设置带有ANSIBLE_开头的环境变量配置）
2. ./ansible.cfg：
3. ~/.ansible.cfg:
4. /etc/ansible/ansible.cfg:软件包管理工具安装自动产生

> Ansible 中，配置文件以 ini 格式存储配置数据，几乎所有的配置项都可以通过Ansible的playbook或环境变量重新赋值

配置参数
-------
1. inventory ： 资源清单文件（连接管理的主机列表），支持多文件（指定文件目录），/etc/ansible/hosts
2. library : 操作动作（模块），/usr/share/ansible，（支持多目录方式，冒号隔开，同时也检查当前执行playbook位置下的./library目录）
3. forks ： 默认情况下Ansible最多有多少个进程同时工作，默认最多5个进程并行处理。
4. sudo_user : 设置默认执行命令的用户，也可以在playbook中重新设置
5. remote_port : 连接管理端口，默认22
6. host_key_checking : 设置是否检查SSH主机的密钥
7. timeout ： SSH连接超时时间
8. log_path : 默认不记录日志，自己设置
