# jps 查看进程问题

* 问题：jps查看进程，显示：`process information unavailable`<br>
  原因：不同账户间kill掉进程，进程没有正常结束(资源占用过大而挂掉、没有结束进程重启计算机)导致<br>
        进程虽然内存中关闭，但linux会在/tmp下寻找临时文件<br>
  解决：`rm -rf /tmp/hsperfdata_*`
