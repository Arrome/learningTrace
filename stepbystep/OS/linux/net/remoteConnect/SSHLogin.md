# SSH 登陆与免密登陆
* 命令登陆原理：
* 免密登陆原理：
    1. 先在serverA上生成一对密钥，将公钥拷贝给serverB并重命名为authorized_keys
    2. serverA向serverB发送一个连接请求，包括用户名/Ip等
    3. serverB得到serverA信息后，回到authorized_keys中查找，如果有相应用户名和IP，serverB会随机生成一个字符串
    4. serverB将使用公钥对字符串进行加密，然后发给serverA
    5. 得到serverB发来的消息后，会使用私钥进行解密，然后将解密后字符串发送到serverB
    6. serverB接收到字符串会跟先前生成的字符串进行对比，如果一致，允许免密登陆
