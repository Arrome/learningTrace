# 配置

`man keepalived.conf`查看配置文件(**注意：配入环境变量才能查看**)<br>

1. #####全局配置

2. #####VRRPD配置
  * vrrp_script 添加一个周期性执行的脚本。脚本的退出状态码会被调用它的所有的VRRP Instance记录
  * vrrp_instance ------ vrrp路由器
    * nopreempt #设置为不抢占
    * preempt_delay #抢占延时，默认5分钟

3. #####LVS配置

>**Keepalived的所有功能是配置keepalived.conf文件来实现的**，配置的解析并非一次解析到内存，而是用到哪个模块时才解析相应的配置<br>
> 配置文件都是以块形式组织，每块都在{}内，`#`和`！`开头的都是注释
