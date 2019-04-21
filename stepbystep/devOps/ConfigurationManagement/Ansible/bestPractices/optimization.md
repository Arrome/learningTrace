# 优化

开启SSH长连接
-----------
利用openssh（高于5.6版本）的Multiplexing <br>
`/etc/ansible/ansible.cfg`中配置`ssh_args = -C -o ControlMaster=auto -o ControlPersist=5d` <br>
开启后ssh连接的设备中都会在`~/.ansible/cp`目录下生成socket文件。`netstat -t`查看到ESTABLISHED状态一直与远端设备连接<br>

开启pipelining
---------------
利用openssl的pipelining特性 <br>
若开启pipelining，本地推送远程的过程将在ssh会话中进行(流程中少了一个PUT脚本去远端服务器的流程)，大大提高执行效率<br>
**注意**：若开启pipelining（ansible.cfg中配置），需要在被控制机/etc/sudoers文件中编辑当前Ansible SSH用户的配置为requiretty，否则会提示`sudo:sorry,you must have a tty to run sudo`

开启accelerate模式
----------------
ansible的accelerate模式，（建立长连接）使用Python程序在远端机上运行一个守护进程，然后ansible会通过这个守护进程监听端口进行通信<br>
**配置方式**:playbook中配置`accelerate: true`,ansible.cfg文件中定义一些accelerate参数<br>
**注意**：控制端和被控制端都要安装 `python-keyczar`软件包<br>

设置facts缓存
------------
playbook默认第一个task都是`Gathering Facts`。<br>

* playbook不需要facts信息，playbook中设置`gather_facts: False`提高效率
* 需要收集，并加速过程，配置缓存.`ansible.cfg`中配置缓存信息
  * 本地内存方式 `fact_caching = memory`
  * 远端缓存方式，例如redis:`fact_caching = redis`
