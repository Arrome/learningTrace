# 构建问题

* 问题：Dockerfile中有访问网络的命令，构建过程报错`Could not resolve host: xxx; Unknown error ... transfer failed`或`[Warning] IPv4 forwarding is disabled. Networking will not work`<br>
  原因：网络原因，dockerfile构建镜像在容器内执行，需要宿主机网络转发。可能ip_forward未开启<br>
  解决： `echo 1 > /proc/sys/net/ipv4/ip_forward`<br>
  注意：基础镜像的ip_forward和复用宿主机的，镜像内其为只读，需要修改宿主机
