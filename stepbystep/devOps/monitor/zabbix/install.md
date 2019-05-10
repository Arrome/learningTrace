# 安装

官方参考：https://www.zabbix.com/download

源码安装方式：
-----------
1. 同时安装server和agent，并支持数据放入mysql数据库：<br>
`./configure --enable-server --enable-agent --with-mysql --enable-ipv6 --with-net-snmp --with-libcurl`
2. 仅安装server，并支持数据放到mysql数据库：<br>
`./configure --enable-server --with-mysql --with-net-snmp --with-libcurl`
3. 仅安装proxy，并支持将数据放到mysql数据库中：<br>
`./configure --profix=/usr --enable-proxy --with-net-snmp --with-mysql --with-ssh2`
4. 如果仅安装agent：<br>
`./configure --enable-agent`

5. 编译安装zabbix：<br>
`make install`

rpm包安装zabbix
------------
1. `yum list all | grep zabbix`
2. 安装zabbix的rpm包源仓库
3. server端安装：zabbix-server，zabbix-server-mysql,zabbix-get
   agent端安装：zabbix-agent,zabbix-sender
   web端安装：zabbix-web，zabbix-web-mysql
4. 初始化数据库，创建zabbix数据库，`rpm -ql zabbix-server-mysql`找到create.sql.gz位置，数据导入mysql：`zcat create.sql.gz | mysql zabbix`
5. 配置/etc/zabbix/zabbix_server.conf，mysql的用户名密码
6. 配置/etc/httpd/conf.d/zabbix.conf，时区`php_value date.timezone `
6. 启动服务:`systemctl restart zabbix-server zabbix-agent httpd`
7. 配置前端：`http://IPAddress/zabbix`

8. 配置/etc/zabbix/zabbix_agentd.conf，配置serverIP
9. 启动zabbix-agent:`systemctl restart zabbix-agent`

Problems
-----
1. 问题：启动zabbix-server或zabbix-agent报错：`zabbix-server.service never wrote its PID file. Failing`<br>
   解决：`setenforce 0`关闭SELinux
