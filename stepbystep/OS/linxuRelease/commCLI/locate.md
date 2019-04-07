# locate

功能：查找文件或目录<br>
特点：比`find -name`快，不搜索具体目录，而搜索一个数据库`/var/lib/mlocate/mlocate.db`.其包含本地所有文件信息。<br>
    Linux系统自动创建这个数据库，并且每天自动更新一次（有时会出现数据库文件未更新，可使用`updatedb`命令手动更新）<br>
额外安装工具：`yum -y install mlocate`<br>

* `/usr/bin/updatedb` 主要用来更新数据库，通过crontab自动完成
* `/usr/bin/locate` 查询文件位置
* `/etc/updatedb.conf` updatedb的配置文件
* `/var/lib/mlocate/mlocate.db` 存放文件信息文件
