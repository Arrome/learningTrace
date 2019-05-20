# KMS 秘钥管理服务器
JavaWeb应用程序，运行在hadoop绑定的tomcat服务器上。<br>
补全hdfs权限管控的安全漏洞（防止用户直接进入存储区域获取块文件拼接文件内容，对文件进行加密解密）

透明加密过程
--------
1. hadoop 读取文件信息，首先发消息到namenode获取block信息
2. namenode接收请求后，返回响应的block信息，同时返回FileEncryptionInfo对象信息，它保存相应的加密方式及keyname（hadoop crypto 使用的keyname）
3. client收到返回消息，判断FileEncryptionInfo对象，不存在则未加密，存在则文件被加密
4. 确认文件是加密文件后，client给KMS发送http消息，获取对应keyname的密码（keytool生成的密钥仓库密码）
5. 获取到密码后，按JCE API要求，返回一个InputStream对象，client获取到直接读取数据
