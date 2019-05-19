# install

1. 下载解压hive
2. （自定义可使用mysql数据库，拷贝mysql启动jar包到lib目录下）
3. conf目录下hive-site.xml(覆盖hive-default.xml)
```
<configuration>
  <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:mysql://192.168.183.154:3306/hive?createDatabaseIfNotExist=true</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>com.mysql.cj.jdbc.Driver</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionUserName</name>
    <value>root</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionPassword</name>
    <value>123456</value>
  </property>
</configuration>
```
4. 初始化hive在mysql里的脚本
```
cd scripts
../bin/schematool -initSchema -dbType mysql
```
未初始化报错：`FAILED: HiveException java.lang.RuntimeException: Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient`
4. 需要写hdfs日志文件，需要hdfs用户（参考yarn安装时用户设置）启动
`./hive`

5. hive交互下创建表结构，会在hdfs `/user/hive/warehouse`
6. 创建文件拷贝到hdfs表目录下
* 列分隔符(不可见字符)：`^A` (ctl+v+a)
* 行分隔符(不可见字符): `\n` 
7. hive交互下查询
