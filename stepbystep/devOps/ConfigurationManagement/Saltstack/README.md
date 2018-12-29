# saltstack

大型**分布式**配置管理系统，扩展性足以支持管理上万台服务器，数秒钟完成数据传递<br>

**语言**：python<br>
**工作方式**：1. master/minion(ZeroMQ PUB-SUB pattern，异步) 2. Salt-SSH 3. masterless<br>
**功能**：1. 远程执行 2. 配置管理 3. 云管理

**组件**：
1. salt-master,salt-minion
2. salt-api
3. salt-ssh
4. salt-syndic
