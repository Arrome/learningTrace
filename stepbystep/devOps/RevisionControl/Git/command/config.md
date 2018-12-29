# git 配置

提交之前需要配置user.name和user.email

多级别git配置
-----------
#####版本库级别配置
文件位置:（.git/config）<br>
命令进入编辑：`git config -e`
#####全局配置（用户主目录下）
文件位置：（~/.gitconfig）<br>
命令进入编辑：`git config -e --global`
#####系统级配置文件
文件位置：（/etc/gitconfig）
命令进入编辑：`git config -e --system`

----------------------------------------

`git config`操作 INI 文件
--------------------
`git config <section>.<key>` 查看配置属性值
`git config <section>.<key> <value>` 修改配置属性值
`GIT_CONFIG=test.ini git config <section>.<key>` 向配置文件test.ini中添加配置
`GIT_CONFIG=test.ini git config <section>.<key> <value>` 从配置文件test.ini中读取配置

配置参数
-----------
* core.quotepath : 默认true，diff命令差异化对比，中文文件乱码，修改为false（支持UTF-8编码）
