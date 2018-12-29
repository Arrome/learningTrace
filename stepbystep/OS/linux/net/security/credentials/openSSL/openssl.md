# OpenSSL颁发数字证书

**一般使用openssl生成证书时都是v1版本的，不带扩展属性**,签署证书时使用扩展属性加入选项`-exfile`和`-extensions v3_req`<br>

建立CA(签发自签名证书)
----------------------
1. 准备openssl
2. 自签发证书，需要建立根证书（根证书用于验证某crt文件是否是CA签发）
  * 生成私钥，例如：生成2048位的rsa私钥，并用3des算法加密`openssl genrsa -des3 -out private/ca.key.pem 2048`
  * 生成证书请求，例如：`openssl req -new -key private/ca.key.pem -out ca.req.pem`输入CA私钥口令后，会提示输入根证书信息，包括国家、城市、组织名、主体名等
  * 签发证书，例如：根据证书请求签发证书`openssl x509 -req -days 1000 -sha1 -extensions v3_ca -signkey private/ca.key.pem -in ca.req.pem -out certs/ca.crt`
3. 颁发用户证书
  * 生成私钥：`openssl genrsa -out private/serverkey.pem 1024`
  * 生成证书请求：`openssl req -new -key private/serverkey.pem -out server.req.pem`
  * 签发证书：`openssl x509 -req -days 100 -sha1 -extensions v3_req -CA certs/ca.crt -CAkey private/ca.key.pem -CAserial ca.sr1 -CAcreateserial -in server.req.pem -out certs/server.crt`
  * 把用户证书和私钥转换成pkcs12格式：`openssl pkcs12 -export -clcerts -in certs/server.crt -inkey private/serverkey.pem -out certs/server.p12`
