# 编译安装方式

**下载地址**：http://www.keepalived.org/software/

1. 准备安装条件(编译需要一个编译器，OpenSSL，Netlink Library.可选Net-SNMP)<br>
* RHEL/CentOS:`yum install -y curl gcc openssl-devel libnl3-devel net-snmp-devel`<br>
* Debian:`apt-get install curl gcc libssl-dev libnl-3-dev libnl-genl-3-dev libsnmp-dev`
2. 下载，解压，编译，安装
```
curl --progress http://keepalived.org/software/keepalived-1.2.15.tar.gz | tar xz
cd keepalived-1.2.15
./configure --prefix=/usr/local/keepalived-1.2.15
make && make install
```
> 报错：`configure: error: libnfnetlink headers missing` -------需要安装`yum install -y libnfnetlink-devel`
3. 设置初始化脚本
* RHEL/CentOS:<br>
`ln -s /etc/rc.d/init.d/keepalived.init /etc/rc.d/rc3.d/S99keepalived`
* Debian:<br>
`ln -s /etc/init.d/keepalived.init /etc/rc2.d/S99keepalived`
或者直接在/etc/rc.local中配置`keepalived -D -f /usr/local/keepalived-1.2.15/etc/keepalived/keepalived.conf`
> **注意**：启动keepalived 如果keepalived.conf配置不合实际会导致启动不起来。`journalctl -xe`命令查看(CentOS-7才有的工具),通过命令`tail -f /var/log/messages | grep XXX`查看输出日志信息
