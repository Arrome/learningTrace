# 全局配置

```
global_defs {            
   notification_email {  #指定keepalived在发生切换时需要发送email到的对象，一行一个
      sysadmin@fire.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc #指定发件人
   smtp_server localhost #指定smtp服务器地址
   smtp_connect_timeout 30 #指定smtp连接超时时间
   router_id LVS_DEVEL #运行keepalived机器的一个标识
}
```
