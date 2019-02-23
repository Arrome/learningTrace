# ansible-tower 安装

安装系统要求：（内存>=2G,否则可能安装失败）

安装包下载地址：`https://releases.ansible.com/ansible-tower`

1. 下载`wget https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.4.0-2.tar.gz`
2. 解压
3. 修改inventory文件 admin_password,pg_password,rabbitmq_password等信息
4. 启动 `./setup.sh`


problems
----------
1. 问题：报错`"No package matching 'ansible-tower == 3.0.3' found available, installed or updated"`<br>
   原因：根据自动生成的repo，发现`http://releases.ansible.com/ansible-tower/setup/` 该仓库是有对应版本的包的,只是enable=0被禁用了<br>
   解决：新建一个repo
```
cat >/etc/yum.repos.d/Ansible-Tower.repo <<EOF
[Ansible-Tower]
name=Ansible Tower Repository - $releasever $basearch
baseurl=http://releases.ansible.com/ansible-tower/rpm/epel-7-$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ansible-release
EOF
```
