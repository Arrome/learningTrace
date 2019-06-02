# kube-proxy

**作用**：**服务发现，负载均衡**。可看作Service透明代理（为Pod提供代理）兼负载均衡器（核心功能：将某个Service请求转发到后端的多个Pod实例上）。感知service，pod变化，将变化的信息写入到本地的iptables中。<br>
Service的ClusterIP与NodePort是kube-proxy服务通过iptables的NAT转换实现的(或IPVS，未配置自动降级到iptables方式)。<br>
**kube-proxy运行过程中动态创建与Service相关的iptables规则**，规则实现ClusterIP及NodePort的请求流量重定向到kube-proxy进程对应服务的代理端口的功能。

* iptables: 没有增量更新功能，更新一条需要整体flush,更新时间长。iptables规则串行匹配，流量经过所有规则匹配后进行转发，时间和内存都极大消耗，性能影响严重。<br>
* ipvs: 增量更新，可以保证service更新期间保持不断开。通过一定规则进行hashmap映射，很快映射到对应规则<br>

kube-proxy主要操作nat和filter表。

PREROUTING链
-----------
```
# iptables -t nat -L PREROUTING   
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
           all  --  anywhere             anywhere            
KUBE-SERVICES  all  --  anywhere             anywhere             /* kubernetes service portals */
DOCKER     all  --  anywhere             anywhere             ADDRTYPE match dst-type LOCAL
```
先进入KUBE-SERVICES链<br>
```
# iptables -t nat -L KUBE-SERVICES
Chain KUBE-SERVICES (2 references)
target     prot opt source               destination         
KUBE-MARK-MASQ  tcp  -- !localhost.localdomain/16  10.98.222.69         /* default/my-service:test-non-selector cluster IP */ tcp dpt:http
KUBE-SVC-M6VBOK5OXJCDOXDA  tcp  --  anywhere             10.98.222.69         /* default/my-service:test-non-selector cluster IP */ tcp dpt:http
KUBE-MARK-MASQ  tcp  -- !localhost.localdomain/16  10.96.0.10           /* kube-system/kube-dns:dns-tcp cluster IP */ tcp dpt:domain
KUBE-SVC-ERIFXISQEP7F7OF4  tcp  --  anywhere             10.96.0.10           /* kube-system/kube-dns:dns-tcp cluster IP */ tcp dpt:domain
KUBE-MARK-MASQ  udp  -- !localhost.localdomain/16  10.96.0.10           /* kube-system/kube-dns:dns cluster IP */ udp dpt:domain
KUBE-SVC-TCOU7JCQXEZGVUNU  udp  --  anywhere             10.96.0.10           /* kube-system/kube-dns:dns cluster IP */ udp dpt:domain
KUBE-MARK-MASQ  tcp  -- !localhost.localdomain/16  10.99.179.213        /* kube-system/tiller-deploy:tiller cluster IP */ tcp dpt:44134
KUBE-SVC-K7J76NXP7AUZVFGS  tcp  --  anywhere             10.99.179.213        /* kube-system/tiller-deploy:tiller cluster IP */ tcp dpt:44134
KUBE-MARK-MASQ  tcp  -- !localhost.localdomain/16  10.96.0.1            /* default/kubernetes:https cluster IP */ tcp dpt:https
KUBE-SVC-NPX46M4PTMTKRN6Y  tcp  --  anywhere             10.96.0.1            /* default/kubernetes:https cluster IP */ tcp dpt:https
KUBE-NODEPORTS  all  --  anywhere             anywhere             /* kubernetes service nodeports; NOTE: this must be the last rule in this chain */ADDRTYPE match dst-type LOCAL
```
根据过滤规则:<br>
* 源地址不是PodIP，目标地址是ClusterIP 先经过 KUBE-MARK-MASQ 再转发到 KUBE-SVC-xxxx（一个service对象）
* 源地址是PodIP，目标地址是ClusterIP 直接转发到 KUBE-SVC-xxx
    * KUBE-SVC-xxxx对应多条KUBE-SEP-xxx链（对应多个Endpoints对象）**等概率随机命中**
* NodePort流量是 KUBE-SERVICES 最后一条链
