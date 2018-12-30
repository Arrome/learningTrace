# CA 双向认证证书

根证书
-------
1. 生成私钥：`openssl genrsa -out ca.key 2048`
2. 生成根证书`openssl req -x509 -new -nodes -key ca.key -subj "/CN=kubernetes" -days 5000 -out ca.crt`

服务端证书
--------
1. `openssl genrsa -out server.key 2048`
2. `openssl req -new -key server.key -subj "/CN=server" -out server.csr`
3. `openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 5000 -extensions v3_req -out server.crt`

客户端证书
--------
1. `openssl genrsa -out client.key 2048`
2. `openssl req -new -key client.key -subj "/CN=client" -out client.csr`
3. `openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 5000`
