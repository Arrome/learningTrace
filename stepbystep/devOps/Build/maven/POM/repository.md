# repository
中央仓库，超级POM
---------
$M2_HOME/lib/maven-model-builder-3.0.jar
```
<repositories>
  <repository>
    <id>central</id>
    <name>Maven repository Switchboard</name>
    <url>http://repo1.maven.org/maven2</url>
    <layout>default</layout>
    <snapshots>
      <enabled>false</enabled>
    </snapshots>
  </repository>
</repositories>
```

自定义仓库
---------
```
<snapshots>
  <enabled>true</enabled>
  <updatePolicy>daily</updatePolicy>
  <checksumPolicy>ignore</checksumPolicy>
</snapshots>
```
* updatePolicy 配置Maven从远程仓库检查更新的频率，
    * daily 默认值，Maven每天检查一次
    * never 从不检查更新
    * always 每次构建都检查更新
    * interval：X 每隔X分钟检查一次更新（X 任意整数）
* checksumPolicy 配置Maven检查检验和文件的策略（构件被部署到Maven仓库中，会同时部署对应的校验和文件，下载构件时Maven会验证校验和文件）
    * warn  默认值，Maven执行构建时输出警告信息
    * fail  Maven遇到校验和错误就让构建失败
    * ignore 使Maven完全忽略校验和错误
