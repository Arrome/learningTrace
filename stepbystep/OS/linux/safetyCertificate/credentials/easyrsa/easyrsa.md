# easyrsa

**初始化easyrsa**：(默认生成在当前目录下的pki目录)<br>
`easyrsa init-pki`

**创建根证书，产生一个CA**：(pki目录下生成一个ca.crt文件，pki/private目录生成ca.key文件)
```
easyrsa --batch "--req-cn=${MASTER_IP}@`date +%s`" build-ca nopass
```
(`--batch`设置自动模式，`--req-cn`默认为CN)<br>

**产生服务器证书和密钥**：(使用配置openssl-1.0.cnf，pki/reqs下生成.req请求文件,pki/private下生成.key私钥文件,pki/issued下生成.crt证书文件)
```
easyrsa --subject-alt-name="IP:${MASTER_IP}" build-server-full kubernetes-master nopass
```
(`build-server-full filename`为服务器生成一个本地密钥对和证书)<br>

> **使用主题为客户端或服务器生成密钥对并在本地签名**：
```
easyrsa --dn-mode=org \
  --req-cn=kubecfg --req-org=system:masters \
  --req-c= --req-st= --req-city= --req-email= --req-ou= \
  build-client-full kubecfg nopass
```
