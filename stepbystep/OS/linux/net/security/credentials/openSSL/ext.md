# extensions

```
basicConstraints = CA:FALSE
authorityKeyIdentifier = keyid,issuer
keyUsage = critical,digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = TLS Web Client Authentication
subjectKeyIdentifier = hash
subjectAltName=xxx  #用来签署多域名证书，除了DNS，还可以指定email，IP，dirName等
```
