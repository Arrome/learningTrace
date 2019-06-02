# Kerberos

开源网络认证协议<br>

实现用户认证，Hadoop不直接管理用户隐私，Kerberos也不关心用户的授权细节，职责：鉴定登录账号是否就是所声称的用户，Hadoop决定该用户到底拥有多少权限。<br>


客户端获得服务过程：
------------------
1. 认证：client向认证服务器发送一条报文，获取一个含时间戳的票据（授予票据 Ticket-Granting Ticket）
2. 授权：client使用票据向票据授予服务器，请求一个服务票据
3. 服务请求：client向服务器（提供客户端所需服务，hadoop中服务器可以是namenode或ResourceManager）出示服务票据，以证实自己合法性

认证步骤通常需要用户调用`kinit`命令执行，过程会提示用户输入密码。默认10小时（`klist`命令查看票据过期时间，`kdestory`命令摧毁票据）<br>
  * 自动认证，登录操作系统时自动执行认证操作
  * 无密码输入提示，通过`ktutil`命令创建一个Kerberos的keytab文件，保存用户密码。

> 认证服务器和票据授权服务器构成密钥分配中心（key-Distribution-center）

`hadoop.security.authentication=kerberos` 默认simple,非认证方式，利用操作系统用户名称决定登录者身份<br>
  使用Kerberos认证，需要安装配置运行一个Key Distribution Center（ApacheDS，搭建kerberos-server）<br>
`hadoop.security.authorization=true` 默认false，设置true启用服务级别的授权。<br>
  可以配置hadoop-policy.xml文件中的访问控制表（ACL）决定哪些用户和组能访问哪些hadoop服务。<br>
