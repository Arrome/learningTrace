# etcdctl

认证方式访问 例如：
```
etcdctl \
--cert-file=/usr/local/kubernetes/pki/client.crt \
--key-file=/usr/local/kubernetes/pki/client.key \
--ca-file=/usr/local/kubernetes/pki/ca.crt \
--endpoints=http://192.168.186.129:2379,http://192.168.186.130:2379,http://192.168.186.132:2379 \
member list
```
