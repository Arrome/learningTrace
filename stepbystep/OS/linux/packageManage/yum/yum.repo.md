# 仓库

```
[extras]  #yum源ID，必须唯一
name=CentOS-$releasever - Extras #具体yum源名称，相当于描述信息
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra  #镜像服务器地址列表，包含多个服务器地址
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/  #镜像服务器地址，只能是具体的确定地址，只能有一个baseurl，但可以多个url
enabled=0
gpgcheck=1  #使用公钥检验rpm正确性，0表示取消校验
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 #校验秘钥
```
