# NTP 网络时间同步协议

安装:`yum install -y ntp`

搭建 NTP 服务器
----------------


同步 NTP 时间
------------
与NTP服务器同步：`/usr/sbin/ntpdate time.windows.com`<br>
定时校准：`crontab -e` <br>
```
# time sync
*/5 * * * * /usr/sbin/ntpdate time.windows.com > /dev/null 2&>1
```
