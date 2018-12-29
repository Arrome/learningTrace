# 进程

僵尸进程
--------
进程表中占用位置（状态defunct），占用系统资源（cpu 内存），数目太多会导致系统瘫痪 <br>

**解决方法**：<br>
1.重启系统 <br>
2.查找僵尸进程父进程并杀死：`ps -A -o stat,ppid,pid,cmd |grep -e "^[Zz]"|awk ‘{print $2}‘|xargs kill -9`
