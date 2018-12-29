#版本特性及版本间对比
#####mysql5.7  mysql8.0

mysql8.0
-------------
1. **身份验证机制**默认使用caching_sha2_password.从原来的 mysql_native_password 更改为 caching_sha2_password。 <br>
    * 使用Debian软件包进行安装或升级会显示一个对话框，其中包含一个用于将默认身份验证插件设置为mysql_native_password的选项,以向后兼容。
    * 从 5.7 升级 8.0 版本的不会改变现有用户的身份验证方法，但新用户会默认使用新的 caching_sha2_password。
2. **字符集编码（utf8mb3,utf8mb4,utf8）**
  在将来的MySQL版本中，utf8mb3字符集将被utf8mb4所取代。 utf8字符集目前是utf8mb3的别名，但在会成为对utf8mb4的引用。 为避免utf8的含义含糊不清，
  _请考虑为字符集引用明确指定utf8mb4而不是utf8_

####JAVA应用开发 mysql8 注意事项
> **注意：驱动版本和数据库版本相匹配<br>**

**驱动类**：com.mysql.cj.jdbc.Driver<br>
**URL**：jdbc:mysql://localhost:3306/seckill?useUnicode=true&characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true

**报错**：
1. 问题：`java.sql.SQLNonTransientConnectionException: Public Key Retrieval is not allowed`<br>
解决：url加上`allowPublicKeyRetrieval=true`
