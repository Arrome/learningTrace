# 问题

* 报错：`x509: cannot validate certificate for <ipaddress> because it doesn't contain any IP SANs`<br>
原因：证书中，要包含一些信息，比如国家、机构等等，**访问的ip或者域名必须要有，否则不予通过**，就会报上面的错误。<br>
解决：例如
```
[ v3_ca ]
subjectAltName = IP:172.10.15.110
```
