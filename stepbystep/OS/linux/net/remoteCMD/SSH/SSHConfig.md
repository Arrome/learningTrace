#SSH远程连接


    id_rsa：保存私钥
    id_rsa.pub：保存公钥
    authorized_keys：保存已授权的客户端公钥
    known_hosts：保存已认证的远程主机公钥

`man ssh_config`查看ssh配置文件说明<br>

用户配置文件~/.ssh/config
---------------------
管理ssh会话，简化工作流程
```
StrictHostKeyChecking no  ##ssh连接时将自动进行添加，可免输入yes进行known_hosts添加
UserKnownHostsFile /dev/null ##免除服务器ip更新，known_hosts未更新导致冲突（时时删除known_hosts文件）
```

系统配置文件(ssh_config和sshd_config)
---------------
客户端和服务器根据配置文件参数改变其运行方式

> [系统语言环境locale配置参考](../env/locale.md)
####1.针对客户端的配置文件ssh_config
```
# SendEnv
SendEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
SendEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
SendEnv LC_IDENTIFICATION LC_ALL LANGUAGE
SendEnv XMODIFIERS
```

####2.针对服务器端的配置文件sshd_config
```
# Accept locale-related environment variables
# AcceptEnv 指定客户端发送的哪些环境变量将会被传递到会话环境中。
#[注意]只有SSH-2协议支持环境变量的传递。指令的值是空格分隔的变量名列表(其中可以使用'*'和'?'作为通配符)。也可以使用多个 AcceptEnv 达到同样的目的。
#需要注意的是，有些环境变量可能会被用于绕过禁止用户使用的环境变量.由于这个原因，该指令应当小心使用。默认是不传递任何环境变量。

AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL
```


**问题记录**：
-------------
1. **问题描述**：`ssh -tt user@host`以脚本方式远程连接服务器并执行脚本(脚本中export LANG=zh_CN.UTF-8)，登陆shell查看LANG变量也为zh_CN.UTF-8，但服务器端内却以LANG=en_US.UTF-8执行的脚本.<br>
  **问题分析**：客户端发送的环境变量将会被传递到会话环境.<br>
  ssh客户端加载的ssh_config配置文件中设置有参数sendEnv,而服务器端sshd_config配置有AcceptEnv。
