# rsa算法指令

**功能**：数字签名、密钥交换和数据加密（rsa加密数据速度慢，通常不使用rsa加密数据）<br>

genrsa
----------
**生成并输入一个RSA私有密钥**,（不会生成公钥，公钥提取自私钥，使用`openssl rsa`命令）<br>

rsa  
-------
**用户管理生成的密钥**<br>

`openssl rsa -in xxx.key -noout -text` 查看密钥各个参数值<br>

rsautl
--------
使用rsa密钥进行加密、解密、签名、验证等运算<br>
