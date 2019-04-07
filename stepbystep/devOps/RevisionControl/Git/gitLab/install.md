# Install

物理机搭建
------
官方安装地址：`https://about.gitlab.com/install/`

1. `rpm -ivh gitlab-ce-11.8.0-ce.0.el7.x86_64.rpm`<br>
  检查有依赖未安装则安装：`yum install -y policycoreutils-python` //10.x以后开始依赖policycoreutils-python<br>

2. 更改配置文件 `/etc/gitlab/gitlab.rb`
  * `grep "^external_url" /etc/gitlab/gitlab.rb`<br>
  绑定监听的域名或IP(外部访问的url，经过编译后自动将这个配置编译到nginx配置)：`external_url http://192.168.204.128`
3. `gitlab-ctl reconfigure` 自动配置，并安装数据库，初始化
4. `gitlab-ctl start` 启动gitlab服务


docker搭建
---------------
1. 下载镜像: `docker pull gitlab/gitlab-ce`


problems
----------
* 问题：访问报错502，Whoops, GitLab is taking too much time to respond.
  解决：<br>
  * 内存过小，不能支持应用（gitlab启动运行之后相当的消耗内存，尤其是做提交更新等处理的时候，建议CPU2核，内存2G以上）
  * 端口占用等问题：`netstat -ntlp`查看端口，配置文件`/etc/gitlab/gitlab.rb`的unicorn
