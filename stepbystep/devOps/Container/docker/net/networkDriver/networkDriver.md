# 网络模式

网络模式
-----

1. Bridge networks: 当多个容器在同一个Docker主机上通信时，最佳
2. Host networks：当网络堆栈不应与Docker主机隔离，但希望隔离其他容器，最佳
3. Overlay networks： 当不同Docker主机上运行容器需要通信时，或者多个应用程序使用swarm服务协同工作时，最佳
4. Macvlan networks： 当从VM设置迁移或需要容器看起来想物理主机（具有唯一mac地址），最佳
5. Third-party network plugins： Docker与专用网络堆栈集成
