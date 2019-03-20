# slave 节点配置

节点需要JDK环境

启动方式
-------
1. `Launch agent via execution of command on the master`
2. `Launch agent via Java Web Start`(适用于所有支持Java程序的系统)
  使用此选项，需要在 全局安全配置 中开启 Agents（port 和 JNLP），slave节点自动使用port指定端口连接
3. `Launch agent on Unix machines via SSH`(适用Unit和linux，通过ssh通道连接节点)
  使用此选项，需要提前安装插件 SSH Slaves plugin
4. `Let Jenkins control this Windows slave as a Windows service`(不建议使用的方式)


节点分类
--------
1. 物理机/虚拟主机
2. `jenkins/jnlp-slave`镜像启动的容器
  启动容器作为slave节点：`docker run jenkins/jnlp-slave -url http://jenkins-server:port -workDir=/home/jenkins/agent <secret> <agent name>`
3. 直接通过docker启动容器，运行后销毁<br>
  系统配置中,配置云->docker配置docker模板
4. k8s启动
  系统配置中，配置云->kubernetes
