# 配置本地yum源，无外网情况下

系统光盘RPM包作为yum仓库源文件
------------------
1. 系统盘RPM包拷贝出来
`ls -l /dev | grep cdrom`<br>
`mount /dev/cdrom /mnt`<br>
`mkdir -p /yum_source`<br>
`cp /mnt/Packages/* /yum_source`<br>
2. createrepo 工具生成仓库
`yum -y install createrepo`<br>
`createrepo -pdo /yum_source /yum_source` 创建yum的 repodata 索引文件，客户端配置访问repodata所在的上层目录<br>
`createrepo --update /yum_source` **每加入一个rpm包需要更新一次**<br>

3. 使用 python 命令开启 80 端口，(要求在 rpm 的路径下执行此命令，)此命令的功能就是通过浏览器把内容发布出去
`cd /yum_source`
`python -m SimpleHTTPServer 80 &> /dev/null &`
5. 查看web服务80端口
`lsof -i :80`
6. `curl http:IPaddress`

> 可能需要关闭防火墙

**httpd构建本地镜像站**：
1. `yum -y install httpd`
2. `systemctl start httpd` 测试是否正确安装
3. createrepo 创建索引文件和更新，(rpm包也放在访问目录下)
`createrepo -pdo /var/www/html /var/www/html`
`createrepo --update /var/www/html`
4. 编辑`/etc/httpd/conf/httpd.conf`文件，修改`DocumentRoot "/var/www/html"`和`DirectoryIndex index.html`
5. `systemctl restart httpd`
