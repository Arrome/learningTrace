# docker容器访问宿主机

docker容器访问宿主机：
--------------------
* **可通过 虚拟网桥IP（docker0）访问宿主机**,<br>

> **不能通过 127.0.0.1/localhost 访问宿主机**

宿主机访问docker容器：
------------------
* **能 ping 通容器IP，可通过端口访问具体应用**

![宿主机访问容器](../images/hostToContainer.png)
