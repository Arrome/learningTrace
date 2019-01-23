# 日志(HttpLog模块)

log_format
----------
语法： `log_format name format [format ...]` <br>
默认值： `log_format combined "..."` <br>
作用域： http server <br>

access_log
----------
语法： `access_log path [format [buffer=size | off ]`<br>
默认值： `access_log log/access.log combined` <br>
作用域： http, server, location <br>

指令 access_log 指派路径、格式和缓存大小。参数 "off" 将清除当前级别的所有 access_log 指令。如果未指定格式，则使用预置的 "combined" 格式。缓存不能大于能写入磁盘的文件的最大大小。在 FreeBSD 3.0-6.0 ，缓存大小无此限制。


默认
---
```
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

access_log  /var/log/nginx/access.log  main;
```
