# clear Container && runV

整合clear Container 和 runV，支持不同平台的硬件（x86-64，arm等）<br>
符合OCI（open Container Initiative）规范，兼容k8s的CRI（container Runtime Interface）接口规范。<br>


亮点：
解决传统容器共享内核的安全和隔离问题，每个容器运行在一个轻量级虚拟机中，使用单独的内核<br>


Docker架构上，kata 替换 runc，当作docker的插件