# facts组件

facts组件--ansible用于采集被管机器设备信息的功能,setup模块查看机器所有facts信息（封装为json字符串），可使用filter查看指定信息。通过变量值引用使用。`ansible test -m setup -a 'filter=ansible_all_ipv4_addresses'`<br>
facts组件默认收集很多设备基础信息，可以在做配置管理时进行引用（**可以直接在playbook中通过变量值引用**）<br>


facter扩展facts信息
----------------
负责收集主机静态信息组件(功能同Puppet的facter)<br>
Ansible facts组件会判断被控制机器上是否安装有facter和ruby-json包，如果存在，Ansible的facts也会采集facter信息。`ansible test -m facter`<br>
所有facter信息在`ansible_facts`下以`facter_`开头，引用方式和自带的facts组件收集的信息引用方式一致


ohai扩展facts信息
------------
ohai是Chef检测节点属性工具。ansible facts也支持ohai信息采集。<br>
被管机器上安装ohai包，`ansible test -m ohai`<br>
所有ohai信息在`ansible_facts`下以`ohai_`开头，引用方式和自带的facts组件收集的信息引用方式一致


facts.d信息
-----------
区分机器的业务角色和属性，经常会在设备初始化后生产一静态文件，文件一般包含这台设备的业务相关信息。<br>
**Ansible支持读取被控制机器文件的方式（fact后缀，Json，INI格式）当做facts信息的数据来源**：setup模块过程：采集过程中会检测被控制机器的fact_path目录下所有以fact结尾的文件，然后读取文件内容当做facts信息收集。**默认路径在`/etc/ansible/facts.d`,setup模块也支持指定fact_path路径**<br>
`ansible test -m setup -a 'filter=ansible_local'`信息在`ansible_local`下

自编写facts模块
---------
