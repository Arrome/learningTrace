# SSH 登陆与免密登陆
* 命令登陆原理：

* 免密登陆原理：
    1. 先在serverA上生成一对密钥，将公钥拷贝给serverB并重命名为authorized_keys
    2. serverA向serverB发送一个连接请求，包括用户名/Ip等
    3. serverB得到serverA信息后，回到authorized_keys中查找，如果有相应用户名和IP，serverB会随机生成一个字符串
    4. serverB将使用公钥对字符串进行加密，然后发给serverA
    5. 得到serverB发来的消息后，会使用私钥进行解密，然后将解密后字符串发送到serverB
    6. serverB接收到字符串会跟先前生成的字符串进行对比，如果一致，允许免密登陆

命令：
1. `ssh-keygen` 为“ssh”生成、管理和转换认证密钥，它支持RSA和DSA两种认证密钥
2. `ssh-copy-id [-i [identity_file]] [user@]machine` 本地主机公钥复制到远程主机authorized_keys文件上，会给远程主机用户主目录，~/.ssh,~/.ssh/authorized_keys设置合适的权限<br>
> 1.主目录权限不能有用户组写权限 2. .ssh 目录700 3. .ssh/authorized_keys文件600

`ssh-agent` 密钥管理器，运行ssh-agent（登陆会话之初启动）后，使用ssh-add将私钥交给ssh-agent保管。其他程序需要身份验证的时候可以将验证申请交给ssh-agent完成整个认证过程

Problems
--------
报错：`Agent admitted failure to sign using the key.`<br>
解决方式：`ssh-add` 把专用密钥添加到ssh-agent高速缓存中。
