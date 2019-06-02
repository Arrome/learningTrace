# 委托令牌

客户端服务器频繁交互，认证过程造成Key Distribution Center巨大压力。Hadoop使用委托令牌支持后续认证访问，避免多次访问KDC。<br>

可视为一个客户端和服务器共享的一个密文，Hadoop代表用户透明进行创建使用<br>

创建过程（例如namenode服务器）：
-------------
客户端首次通过RPC访问namenode时，客户端没有委托令牌，需要利用Kerberos认证，之后客户端从namenode取得一个委托令牌。在后续RPC调用中，客户端出示委托令牌，namenode验证委托令牌，验证客户端身份
