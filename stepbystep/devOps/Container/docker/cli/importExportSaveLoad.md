# 容器导入导出

将镜像保存成tar归档文件/归档文件导成镜像

两种方法：
--------
两种方法不可混用
1. save & load

`docker save ubuntu:load > /root/ubuntu.tar`<br>
或者<br>
`docker save -o /root/ubuntu.tar ubuntu:load`<br>
-o 表示输出到的镜像文件

`docker load < ubuntu.tar`<br>
或者<br>
`docker load -i ubuntu.tar`

2. export & import

`docker export a404c6c174a2 > mysql.tar`<br>
或<br>
`docker export -o mysql.tar a404c6c174a2`<br>
-o 表示输出到的镜像文件

`docker import mysql.tar mysql`<br>
-c 表示应用docker指令创建镜像
-m 表示提交时的说明文字

export和save区别
----------------
* export：从容器（containers）中导出<br>
  save：从镜像（images）中导出<br>
* export：导出的文件再import无法保留镜像所有历史（即每一层layer信息），不能进行回滚操作<br>
  save: 根据镜像而来，导入时可以保留每一层layer信息<br>
  export导出的文件略小于save导出文件<br>
