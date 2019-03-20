# crontab

系统服务启动：`systemctl status crond`<br>

全局配置文件
-----------
crontab在/etc目录下面存在cron.hourly，cron.daily，cron.weekly，cron.monthly，cron.d五个目录和crontab，cron.deny两个文件。<br>
* cron.daily是每天执行一次的job
* cron.weekly是每个星期执行一次的job
* cron.monthly是每月执行一次的job
* cron.hourly是每个小时执行一次的job
* cron.d是系统自动定期需要做的任务
* crontab是设定定时任务执行文件
* cron.deny文件就是用于控制不让哪些用户使用Crontab的功能

用户配置文件
-----------
每个用户都有自己的cron配置文件。可通过`crontab -e`编辑。<br>
一般编辑好用户的cron配置文件保存退出后，系统会自动存放于/var/spool/cron目录中，文件以用户名命名。<br>
linux的cron服务是每隔一分钟去读取一次/var/spool/cron,/etc/crontab,/etc/cron.d下面所有内容


crontab文件格式
----------
查看crontab文件格式：`more /etc/crontab`
```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
# For details see man 4 crontabs
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed
```

列出当前用户定时任务：`crontab -l`<br>
删除当前用户定时任务：`crontab -r`
