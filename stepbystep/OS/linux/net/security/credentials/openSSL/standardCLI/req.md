# req
**功能**：
1. 生成证书请求： 使用`-new`选项
2. 生成自签名证书： 使用`-x509`选项
3. 校验，查看请求文件等

> req命令有缺省configure文件 /etc/pki/tls/openssl.cnf

`openssl req -in xxx.csr -noout -text` 查看证书请求文件
