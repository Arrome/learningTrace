# flannel

作用：只提供网络通讯，不能提供网络策略，结合calico使用其网络策略
开发语言：Golang

flannel支持后端：
  1. VxLAN：使用内核的VXLAN封装数据包
    1）vxlan
    2）Directrouting
  2. host-gw
  3. UDP：不可用于生产，仅在内核或网络无法使用VXLAN或host-gw时，用UDP进行debug

flannel配置参数：
  Network：flannel使用CIDR格式的网络地址，用于为Pod配置网络功能
   10.244.0.0/16 -->
      master:10.244.0.0/24
      node01:10.244.1.0/24
      ...
      node255:10.244.255.0/24
  SubnetLen:把Network切分子网供各节点使用时，使用多长的掩码进行切分，默认24位
  SubnetMin：
  SubnetMax：
  Backend：vxlan,host-gw，udp
