# 隧道模式

![](../../../images/LVS_TUN.jpg)

![](../../../images/LVS_TUN.png)

思路：请求和响应数据分离（要求真实服务器可以直接与外部网络连接，直接响应数据给客户端）<br>
负载均衡设备把请求报文通过IP隧道(数据包封装技术，将原始数据包封装并添加新的包头，即新的源地址及端口和目标地址端口)转发到真实服务器，真实服务器将响应报文直接返回给客户端用户。

> RS 为公网地址，RS网关不可能指向DS <br>
> 所有请求经过DS，响应报文必须不能经过DS <br>
> RS系统必须支持隧道 <br>
