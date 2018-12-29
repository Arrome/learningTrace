# 认证

方式一：基于CA根证书签名的双向数字证书认证
-------------------------
**证书内容不能直接读取使用，需要用base64加密**，`cat xxx.crt | openssl base64`或`cat xxx.crt | base64`<br>
**解密查看**：`echo “xxx” | base64 --decode`
配置kubeconfig中certificate-authority-data,client-certificate-data,client-key-data，需要使用base64加密的内容

方式二：HTTP Token认证
----------------------


方式三：HTTP Base认证
------------------
