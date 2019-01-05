# kubeconfig
用于组织关于**集群、用户、命名空间和认证机制**(配置集群访问)的信息<br>

`kubectl config view`<br>
主要包含：
1. clusters
2. contexts（cluster，namespace，user）
3. users

clusters
--------
```
clusters:
- cluster:
    certificate-authorization: /path/to/ca.crt
    server: https://apiserverIP1:6443
  name: xxx-cluster
- cluster:
    insecure-skip-tls-verify: true
    server: https://apiserverIP2:6443
  name: xxx-cluster
```
集群端点数据：
1. kubernetes apiserver完整URL 以及 集群证书颁发机构
2. 或者 当集群的服务证书未被系统信任的证书颁发机构签名时，设置`insecure-skip-tls-verify: true`

users
---------
```
users:
- name: xxx-user
  user:
    token: xxx-token
- name: xxx-user
  user:
    client-certificate: /path/to/cert
    client-key: /path/to/key
```
user 定义用于k8s集群进行身份认证的客户端凭据。**真正的用户信息是从证书中读取的**

contexts
--------
```
contexts:
- context:
    cluster: xxx-cluster
    namespace: xxx-ns
    user: xxx-user
  name: xxx-context
```
context定义一个命名cluster，user，namespace元组（三者皆可选），**用于提供的认证信息和命名空间将请求发送到指定的集群。**

current-context
-----------
作为cluster，user，namespace元组的key
