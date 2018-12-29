# 安装

方式一、yum库下载安装
---------
1. master上`yum install salt-master`并启动服务`systemctl start salt-master`
2. minion上`yum install salt-minion`<br>
  修改配置文件/etc/salt/minon,配置masterIP<br>
  启动服务`systemctl start salt-minion`

方式二、salt-bootstrap
----------

方式三、pip
------------
