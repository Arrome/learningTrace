# yum.conf

```
[main]
cachedir=/var/cache/yum/$basearch/$releasever #yum下载RPM包的缓存目录
keepcache=0  #缓存是否保存，1保存，0不保存
debuglevel=2  #调试级别(0-10)
logfile=/var/log/yum.log  #yum日志文件
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=5
bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum
distroverpkg=centos-release
```
