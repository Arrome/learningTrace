# 安装配置

1. 创建密钥存储数据库（keystore）
jdk密钥生成器keytool生成密钥：`keytool -genkey -alias 'kmskey' -keystore /root/kms.keystore -dname "CN=localhost, OU=localhost, O=localhost, L=SH, ST=SH, C=CN" -keypass 123456 -storepass 123456 -validity 180`

> 一个keystore可以放多个密钥，只要多次生成密钥，指向同一个keystore<br>

2. kms通过一个文本文件获取keystore密码

3. 配置kms-site.xml
* keystore文件位置
* keystore密码文件：放在`share/hadoop/kms/tomcat/webapps/kms/WEB-INF/classes`目录下
```
<configuration>
  <property>
    <name>hadoop.kms.key.provider.uri</name>
    <value>jceks://file@/${user.home}/kms.keystore</value>
    <description>
      URI of the backing KeyProvider for the KMS.
    </description>
  </property>
  <property>
    <name>hadoop.security.keystore.java-keystore-provider.password-file</name>
    <value>kms.keystore.password</value>
    <description>
      If using the JavaKeyStoreProvider, the file name for the keystore password.
    </description>
  </property>
</configuration>
```
4. 配置 kms 服务所需要的环境变量 kms-env.sh
```
export KMS_LOG=${KMS_HOME}/logs
export KMS_HTTP_PORT=16000
export KMS_ADMIN_PORT=`expr ${KMS_HTTP_PORT} + 1`
```
5. 配置kms-site.xml
```
<property>
     <name>dfs.encryption.key.provider.uri</name>
     <value>kms://http@localhost:16000/kms</value>
</property>
```
5. 配置core-site.xml
```
<property>
    <name>hadoop.security.key.provider.path</name>
    <value>kms://http@localhost:16000/kms</value>
</property>
```
6. 重启hadoop集群
```
sbin/kms.sh start
```

hadoop创建密钥命令
---------------
`hadoop key create testkey`

hdfs创建加密区
---------------
`hdfs crypto -createZone -keyName xxxkey -path /xxxxpath`<br>
`hdfs crypto -listZones`
