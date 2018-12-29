# ssh远程连接拒绝，ssh 安装

1. 查看 ssh 是否启动 `ps -ef | grep sshd`
2. 若未启动， `sudo service ssh start`
3. 若无 ssh.service 服务，安装 ssh服务 `sudo apt-get install openssh-server`
4. 重新启动sshd服务 `sudo service ssh start`
