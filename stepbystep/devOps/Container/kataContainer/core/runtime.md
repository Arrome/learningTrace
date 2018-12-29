# clear Container && runV

符合OCI运行时规范的实现，为每个容器（Docker角度）或每个Pod（K8S角度）增加了一个独立的linux内核（不共享宿主机内核），使容器有**更好的隔离性，安全性**。
