#常用组合命令

1.强杀服务<br>

`ps -ef | grep XXX | grep -v 'grep' | awk '{print $2}' | xargs kill -9`

2.查看目录下最大的几个文件

**会包含目录**：<br>
  ```du -ak SOURCE_DIR | sort -nrk 1 | head -4```<br>
**不包含目录**：<br>
  ```find . -type f -exec du -k {} \; | sort -nrk 1 | head -4```<br>

3.查看某目录下所有文件是否包含某字符串<br>
  ```grep -lR   "some_code"  YOUR_DIR```<br>
  或```find test|xargs grep -ri "aaa"```

4.查看linux用户<br>
  `cat /etc/passwd | grep -v nologin | grep -v halt | grep -v shutdown | awk -F":" '{print $1"|"$3"|"$4}' | more`

5.查看进程启动时常<br>
  `ps -eo pid,lstart,etime | grep 5176`

6.查看端口是否占用<br>
  `lsof -i:8080`<br>
  或`netstat -anp | grep 8080`
