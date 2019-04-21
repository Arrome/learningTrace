# VRRPD配置
  * vrrp_script 添加一个周期性执行的脚本。脚本的退出状态码会被调用它的所有的VRRP Instance记录
  * vrrp_instance ------ vrrp路由器
    * nopreempt #设置为不抢占
    * preempt_delay #抢占延时，默认5分钟

vrrp_script
------------
通过脚本对业务进行检查监控（根据业务进程的运行状态决定是否需要进行主备切换）
```
vrrp_script checkhaproxy
{
    script "/home/check.sh"
    interval 3
    weight -20  #脚本返回非0，则优先级-20。若不设置weight选项值，集群优先级选择由priority值决定。
}
```
**vrrp_script里weight和priority两个来控制主从角色。**<br>
* weight为正，脚本检测成功时，weight+priority;检测失败不加：<br>
  1. 主失败：主priority<从priority+weight,切换
  2. 主成功：主priority+weight>从priority+weight，不切换

* weight为负，脚本检测失败时`priority-abs(weight)`,检测成功不加：<br>
  1. 主失败：主`priority-abs(weight)`<从priority时，切换
  2. 主成功：主priority>从priority，不切换


vrrp_sync_group
---------------
不使用sync group的话，如果机器(route)有两个网段，一个内网一个外网，每个网段开启一个VRRP实例，假设VRRP设置为检查内网，那么当外网出现问题时，VRRPD认为自己依然健康，不会发送Master和Backup的切换，从而导致问题。
```
#作用：确定失败切换（FailOver）包含的路由实例个数。
vrrp_sync_group VG_1{ #监控多个网段的实例
group {
　　　　VI_1 #实例名
　　　　VI_2
　　　　......
}
notify_master /path/xx.sh #指定当切换到master时，执行的脚本
netify_backup /path/xx.sh #指定当切换到backup时，执行的脚本
notify_fault "path/xx.sh VG_1" #故障时执行的脚本
notify /path/xx.sh
smtp_alert #使用global_defs中提供的邮件地址和smtp服务器发送邮件通知
}
```

vrrp_instance
-------------
定义虚拟路由
```
vrrp_instance VI_1 {
    state BACKUP #指定那个为master，那个为backup，如果设置了nopreempt这个值不起作用，主备靠priority决定
    interface eth0 #设置实例绑定的网卡
    dont_track_primary #忽略vrrp的interface错误（默认不设置）
    track_interface{ #设置额外的监控，里面那个网卡出现问题都会切换
      eth0
      eth1
    }
    mcast_src_ip #发送多播包的地址，如果不设置默认使用绑定网卡的primary ip
    garp_master_delay #在切换到master状态后，延迟进行gratuitous ARP请求
    virtual_router_id 50 #VPID标记
    priority 99 #优先级，高优先级竞选为master
    advert_int 1 #检查间隔，默认1秒
    nopreempt #设置为不抢占 注：这个配置只能设置在backup主机上，而且这个主机优先级要比另外一台高
    preempt_delay #抢占延时，默认5分钟
    debug #debug级别
    authentication { #设置认证
        auth_type PASS #认证方式
        auth_pass 111111 #认证密码
    }
    virtual_ipaddress { #设置vip
        192.168.202.200
    }
}
```
