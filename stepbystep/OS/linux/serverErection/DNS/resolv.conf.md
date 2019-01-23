# 配置DNS

DNS客户机配置文件：`/etc/resolv.conf`设置DNS服务器的IP地址及DNS域名，包含主机域名搜索顺序

```
nameserver  //定义DNS服务器IP地址，必选
domain      //定义本地域名
search      //定义域名搜索列表，domain和search不能共存，若同时存在，后面出现的将会被使用
sortlist    //对返回的域名进行排序
```
