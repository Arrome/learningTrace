# ansible-galaxy

免费的用于查找，下载，评论各种社区开发的 Ansible 角色<br>
默认情况下，命令行工具使用服务器地址`https://galaxy.ansible.com`与Galaxy网站API通信。 由于Galaxy项目是一个开源项目，可能会运行自己的内部Galaxy服务器，并希望覆盖默认的服务器地址,则可以使用`-server`选项或通过在`ansible.cfg`文件中设置Galaxy服务器值来执行此操作。<br>
`ansible-galaxy install` 默认将对应角色安装到`/etc/ansible/roles`目录下

* `ansible-galaxy install username.rolename`
* `ansible-galaxy install -r roles.yaml`
