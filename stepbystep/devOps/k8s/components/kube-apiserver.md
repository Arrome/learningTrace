# kube-apiserver

本身是一个Service，名字为Kubernetes，ClusterIP是ClusterIP地址池里第一个地址，服务端口是HTTPS端口443.<br>
apiserver仅接收JSON格式的资源定义<br>

启动参数
----------
```
--authorization-mode=Node,RBAC
--advertise-address=192.168.186.134
--allow-privileged=true
--client-ca-file=/etc/kubernetes/pki/ca.crt  #提供认证文件，通过其进行认证
--enable-admission-plugins=NodeRestriction
--enable-bootstrap-token-auth=true
--etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
--etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
--etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key
--etcd-servers=https://127.0.0.1:2379
--insecure-port=0
--kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt   #权限控制的启动参数
--kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key         #权限控制的启动参数
--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
--proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
--proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key
--requestheader-allowed-names=front-proxy-client
--requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
--requestheader-extra-headers-prefix=X-Remote-Extra-
--requestheader-group-headers=X-Remote-Group
--requestheader-username-headers=X-Remote-User
--secure-port=6443
--service-account-key-file=/etc/kubernetes/pki/sa.pub
--service-cluster-ip-range=10.96.0.0/12
--tls-cert-file=/etc/kubernetes/pki/apiserver.crt
--tls-private-key-file=/etc/kubernetes/pki/apiserver.key
```
