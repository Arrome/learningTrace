# 安装

1. 下载解压hadoop
2. 安装JDK
3. 创建用户（单独用户来启动对应进程）
```
groupadd hadoop
useradd -g hadoop hdfs
useradd -g hadoop yarn
useradd -g hadoop mapreduce
```
4. 创建数据和日志目录
```
mkdir -p /var/data/hadoop/hdfs/nn
mkdir -p /var/data/hadoop/hdfs/snn
mkdir -p /var/data/hadoop/hdfs/dn
chown hdfs:hadoop /var/data/hadoop/hdfs -R
mkdir -p /var/log/hadoop/yarn
chown yarn:hadoop /var/log/hadoop/yarn -R
```
进入yarn安装目录，即hadoop目录
```
mkdir logs
chmod g+w logs
chown yarn:hadoop . -R  # 所有权限设置为yarn
```
5. 配置hadoop/etc/hadoop/core-site.xml
  * fs.default.name 为NameNode指定主机名和请求端口
  * hadoop.http.staticuser.user 指定hdfs默认用户名
```
<configuration>
  <property>
    <name>fs.default.name</name>
    <value>hdfs://hdp-02:9000</value>
  </property>
  <property>
    <name>hadoop.http.staticuser.user</name>
    <value>hdfs</value>
  </property>
</configuration>
```
6. 配置hadoop/etc/hadoop/hdfs-site.xml
指定NameNode、Secondary NameNode、DataNode 存储目录
```
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:/var/data/hadoop/hdfs/nn</value>
  </property>
  <property>
    <name>fs.checkpoint.dir</name>
    <value>file:/var/data/hadoop/hdfs/snn</value>
  </property>
  <property>
    <name>fs.checkpoint.edits.dir</name>
    <value>file:/var/data/hadoop/hdfs/snn</value>
  </property>
  <property>
    <name>dfs.datanode.data.dir</name>
    <value>file:/var/data/hadoop/hdfs/dn</value>
  </property>
</configuration>
```
7. 配置mapred-site.xml
  * mapreduce.framework.name 为MapReduce指定框架名，它将作为某框架的应用程序运行
```
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>
```
8. 配置yarn-site.xml
yarn.nodemanager.aux-services 告诉NodeManager需要实现一个名为mapreduce.shuffle的辅助服务。之后将给它一个类名作为实现该服务的方法。（告诉MapReduce怎么去shuffle，默认情况下NodeManager不会给一个非MapReduce作业做数据shuffle）
```
<configuration>
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>192.168.183.154</value> <!--默认0.0.0.0，yarn客户端找不到resourcemanager-->
  </property>
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
  <property>
    <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
  </property>
</configuration>
```
9. 调整java堆的大小(如下为小的工作站或服务器配置)
`etc/hadoop/*-env.sh`的变量值调整
* `etc/hadoop/hadoop-env.sh`内容
```
HADOOP_HEAPSIZE="500"
HADOOP_NAMENODE_INIT_HEAPSIZE="500"
```
* `etc/hadoop/mapred-env.sh`内容：
`HADOOP_JOB_HISTORYSERVER_HEAPSIZE=250`
* `etc/hadoop/yarn-env.sh`内容
```
JAVA_HEAP_MAX=-Xmx500m
YARN_HEAPSIZE=500
```
10. 格式化hdfs
```
su - hdfs
cd bin
./hdfs namenode -format
```
11. 启动hdfs服务
格式化hdfs后，可以启动hdfs服务。<br>
```
cd sbin
./hadoop-daemon.sh start namenode
./hadoop-daemon.sh start secondarynamenode
./hadoop-daemon.sh start datanode
```
12. 启动yarn服务
以用户yarn启动ResourceManager和NodeManager
```
cd sbin
./yarn-daemon.sh start resourcemanager
./yarn-daemon.sh start nodemanager
```
13. 通过web接口验证服务
* hdfs: `http://ipaddress:50070`
* yarn（resourceManager）: `http://localhost:8088`
