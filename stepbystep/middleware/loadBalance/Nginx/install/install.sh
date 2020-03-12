#!/bin/bash

#初始化环境变量
source ./init.sh

#配置vim 编辑配置文件语法格式
if [[ `command -v vim` == "" ]];then
  yum install -y vim
fi
if [[ ! -d ~/.vim ]];then
  mkdir -p ~/.vim
fi
cp -r ${NGINX_SRC_HOME}/contrib/vim/*  ~/.vim

# 创建nginx用户
egrep "^${USER}" /etc/passwd >& /dev/null
if [[ `id -u ${USER}` != "" ]];then
  useradd nginx
fi

# 编译安装
cd ${NGINX_SRC_HOME} || exit
./configure --prefix=${NGINX_TARGET_HOME}
make
make install

:"
#如果为热升级，则可在编译源文件中拷贝生成的nginx
mv ${NGINX_TARGET_HOME}/nginx ${NGINX_TARGET_HOME}/nginx.old
cp -r ${NGINX_SRC_HOME}/objs/nginx ${NGINX_TARGET_HOME}
kill -USR2 <nginx-master-pid>
#老版本进程保留，可reload版本回退
kill -WINCH <nginx-master-pid>
"

# nginx 版本
nginx -v && nginx -V

# nginx启动
nginx -s reload

:"
#可定时任务，进行日志切割
mv ${NGINX_TARGET_HOME}/logs/error.log ${NGINX_TARGET_HOME}/logs/error_`date +%Y%m%d`.log
mv ${NGINX_TARGET_HOME}/logs/access.log ${NGINX_TARGET_HOME}/logs/access_`date +%Y%m%d`.log
kill -USR1 <nginx-master-pid> #nginx -s reopen
"