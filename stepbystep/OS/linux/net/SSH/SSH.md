#SSH

SSH协议
------------
1. SSH是应用层和传输层基础上的安全协议。
2. 通过SSH可以对所有传输的数据进行加密，也能够防止 DNS 欺骗和 IP 欺骗。

**加密方式**：
  1. 对称加密：加密解密使用同一套密钥
  2. 非对称加密：公钥加密后的密文只能由私钥进行解密

> **注意**：scp和ssh等远程操作命令一起操作时，注意**连接时延而导致远程操作的顺序发生变化，使用sleep来延长**

sshd|scp|slogin|sftp
-------------------
* **服务器**：一个守护进程(一般是sshd进程)，后台运行并响应来自客户端的连接请求，提供了对远程连接的处理，一般包括公共密钥认证、密钥交换、对称密钥加密和非安全连接。<br>
* **客户端**：
  1. ssh(远程连接)
  2. scp（远程拷贝）
      * **注意**：**scp远程拷贝会丢失软链接**，可通过压缩解压缩方式
  3. slogin（远程登陆）
  4. sftp（安全文件传输）
  5. ssh-add
  6. ssh-agent
  7. ssh-keygen
  8. ssh-keyscan

> SSH命令：(默认省略端口22,-p指定端口)<br>
> 本地用户名和远程用户名相同可省略用户名：`ssh host`
