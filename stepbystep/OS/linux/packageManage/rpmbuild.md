# rpm 包制作

1. 安装打包环境
`yum install -y rpm-build rpmdevtools`

2. 生成工作目录
`rpmdev-setuptree`(默认在当前用户主目录下构建，修改`.rpmmacros`的`_topdir`的值改变默认位置)<br>
```
├── BUILD 编译rpm包的临时目录
├── RPMS  最终生成的可安装的rpm包的目录
├── SOURCES 源码包和补丁文件，无需解压
├── SPECS spec脚本文件，基本信息，构建信息
└── SRPMS 最终生成的rpm源码格式包路径
```
3. 构建rpm包
`rpmbuild -ba SPECS/xxx.spec`

rpm包解压
--------------
rpm包通过cpio格式打包，先解压成cpio再解压:<br>
`rpm2cpio xxx.rpm | cpio -div`
