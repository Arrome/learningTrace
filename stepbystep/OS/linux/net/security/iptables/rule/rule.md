# 规则

白名单、黑名单
-------
当链的默认策略设置为ACCEPT时，若链中没有配置任何规则，表示接受所有报文；若对应链中存在规则，但是这些规则没有匹配到的报文还是会被接受。<br>
当链的默认策略设置为DROP时，若链中没有配置任何规则，表示拒绝所有报文；若链中存在规则，但是这些规则没有匹配到报文，报文还是会被拒绝<br>

增
---
表头新增一条：`iptables -t tableName -I INPUT -s 192.168.42.106 -j DROP`
表尾新增一条：`iptables -t tableName -A INPUT -s 192.168.42.106 -j DROP`
表中新增编号：`iptables -t tableName -I INPUT 2 -s 192.168.42.106 -j DROP`

删
----
清空表中某链全部规则：`iptables -t tableName -F INPUT`
删除第n条规则：`iptables -D INPUT n`
按具体匹配条件和动作删除规则：`iptables -D INPUT -s 192.168.42.106 -j ACCEPT`


改
---
修改某条规则：`iptables -R INPUT 1 -s 192.168.42.106 -j ACCEPT`
修改某条链中默认策略：`iptables -t filter -P FORWARD DROP`

> **注意**： 修改某条规则时，必须指定规则原本的所有匹配条件


查
---
查看带编号：`iptables -nvL INPUT --line`

保存规则
-------
**默认情况下，对防火墙修改都是临时的，重启防火墙或重启服务器后，规则的改动都将消失，需要将规则保存**<br>
方式一：<br>
Centos6，使用`service iptables save`保存，默认存储在/etc/sysconfig/iptables文件中<br>
Centos7，安装iptables-services，可使用Centos6方法<br>
方式二：<br>
使用iptables-save命令，`iptables-save > /etc/sysconfig/iptables`<br>
重载规则:`iptables-restore < /etc/sysconfig/iptables`<br>
