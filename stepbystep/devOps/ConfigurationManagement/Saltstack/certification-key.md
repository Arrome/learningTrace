# 认证

master 和 minion端采用** key 管理**，**minion只有被master接受key后，才能进行管理，同时master端pub key传到minions上，实现双向认证**<br>

**数据传输**：采用AES加密<br>

**keys默认存储在**：/etc/salt/pki 目录下<br>

> `salt-key` (master上)key管理：<br>
`salt-key -L` 查看key信息管理

认证过程
--------
1. 启动minion服务后，会产生一个密钥对，然后minion会根据配置的master地址去连接master，并尝试把公钥发给master，minion_id表示minio的身份(若未配置id值，默认为主机名)。
2. 在master上可以使用`salt-key`来查看密钥认证的情况，直到密钥认证后，master和minion就可以通信了，我们就可以通过state模块来管理minion

> **salt-master需要关闭防火墙**，可能致使minion无法连接master,获取不到key认证信息

端口监听
--------
1. minion 没有监听端口，和master认证后一直和master 4505端口连通
2. master 监听4505端口（消息发布端口），4506端口（消息接收端口，命令执行返回结果）
