# 网卡设备

linux工具：ethtool(显示更改网卡设置的工具)

网卡设备命名：网卡类型+网卡序号，例如：以太网设备名ethN（N从0开始数字，代表网卡序号）
> linux支持一块物流网卡绑定多个IP地址，每个绑定的IP地址需要一个虚拟网卡，网卡设备名：ethN:M(N和M均从0开始数字)

配置
-----
`/etc/sysconfig/network-scripts/ifcfg-<网络接口名>` 配置网卡IP地址，子网掩码，默认网关（本地路由器地址，用于与不在本网段的主机进行交互）
```
DEVICE=eth0      ## 网卡设备名称
ONBOOT=yes       ## 计算机启动时是否启动网卡
NETMASK=255.255.255.0  ## 子网掩码
IPADDR=192.168.0.1    ## IP地址
HWADDR=00:0c:29:ec:a8:50  ## 物理地址（MAC）
GATEWAY=192.168.0.1       ## 默认网关地址
TYPE=Ethernet             ## 网卡类型
USERCTL=no           ## 是否允许普通用户启动网卡   
IPV6INIT=no          ## 是否支持IPV6
PEERDNS=yes ## 是否允许自动修改/etc/resolv.conf文件        
```
> 若设置自动获取IP地址，提供 `BOOTPROTO=dhcp`
