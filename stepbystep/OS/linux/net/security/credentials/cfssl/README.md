# cfssl

开发语言：Golang<br>
CloudFlare开源的一款PKI/TLS工具。 CFSSL 包含一个命令行工具 和一个用于 签名，验证并且捆绑TLS证书的 HTTP API 服务。

CFSSL包括：
* 一组用于生成自定义 TLS PKI 的工具
* cfssl程序，是CFSSL的命令行工具
* multirootca程序是可以使用多个签名密钥的证书颁发机构服务器
* mkbundle程序用于构建证书池
* cfssljson程序，从cfssl和multirootca程序获取JSON输出，并将证书，密钥，CSR和bundle写入磁盘
