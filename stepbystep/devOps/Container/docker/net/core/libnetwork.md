# docker网络库（libnetwork）

通过**插件形式为Docker提供网络功能**，使用户可以根据自己需求实现Driver来提供不同的网络功能<br>
Docker daemon通过调用libnetwork对外API完成网络创建管理。

CNM（container network model）
-----------------------
![CNM](../../images/cnm.png)

**CNM 定义构建容器虚拟化网络的模型，同时提供可用于开发网络驱动的标准化接口和组件。**
* Sandbox : 对应**容器中网络环境**（无实体），包括：相应的网卡配置、路由表、DNS配置等。
* Endpoint : 容器中虚拟网卡，容器中显示为eth0、eth1等。
* Network : 相互通信的容器网络，本质上：主机的虚拟网卡或网桥。**两个网络间完全隔离**
