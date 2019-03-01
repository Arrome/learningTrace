# LVS配置
包括虚拟主机和虚拟主机组，这些配置都会传递给ipvsadm作为参数

```
virtual_server_group <STRING> {
  # VIP PORT
  <IPADDR> <PORT>
  <IPADDR> <PORT>
  ...
  fwmark <INT>
}
```

```
virtual_server 192.168.202.200 23 {  //VIP地址，要和vrrp_instance模块中的virtual_ipaddress地址一致
　　　　delay_loop 6 #健康检查时间间隔
　　　　lb_algo rr #lvs调度算法rr|wrr|lc|wlc|lblc|sh|dh
　　　　lb_kind DR #负载均衡转发规则NAT|DR|RUN
　　　　persistence_timeout 5 #会话保持时间
　　　　protocol TCP #使用的协议
　　　　persistence_granularity <NETMASK> #lvs会话保持粒度
　　　　virtualhost <string> #检查的web服务器的虚拟主机（host：头）
　　　　sorry_server<IPADDR> <port> #备用机，所有realserver失效后启用


  real_server 192.168.200.5 23 {             //RS的真实IP地址
      weight 1 #默认为1,0为失效
      inhibit_on_failure #在服务器健康检查失效时，将其设为0，而不是直接从ipvs中删除
      notify_up <string> | <quoted-string> #在检测到server up后执行脚本
      notify_down <string> | <quoted-string> #在检测到server down后执行脚本

      TCP_CHECK {                    //常用
          connect_timeout 3 #连接超时时间
          nb_get_retry 3 #重连次数
          delay_before_retry 3 #重连间隔时间
          connect_port 23  健康检查的端口的端口
          bindto <ip>   
      }

      HTTP_GET | SSL_GET{          //不常用
          url{ #检查url，可以指定多个
               path /
               digest <string> #检查后的摘要信息
               status_code 200 #检查的返回状态码
          }
          connect_port <port>
          bindto <IPADD>
          connect_timeout 5
          nb_get_retry 3
          delay_before_retry 2
      }

      SMTP_CHECK{                 //不常用
          host{
            connect_ip <IP ADDRESS>
            connect_port <port> #默认检查25端口
            bindto <IP ADDRESS>
          }
          connect_timeout 5
          retry 3
          delay_before_retry 2
          helo_name <string> | <quoted-string> #smtp helo请求命令参数，可选
      }

      MISC_CHECK{                 //不常用
          misc_path <string> | <quoted-string> #外部脚本路径
          misc_timeout #脚本执行超时时间
          misc_dynamic #如设置该项，则退出状态码会用来动态调整服务器的权重，返回0 正常，不修改；返回1，检查失败，权重改为0；返回2-255，正常，权重设置为：返回状态码-2
      }
  }
}
```
