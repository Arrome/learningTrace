# 发布

```
<distributionManagement>
  <repository>
    <!--id唯一标识，匹配settings.xml中server元素id-->
    <id>proj-releases</id>
    <name>proj releases</name>
    <url>http://127.0.0.1/content/repositories/proj-releases</url>
  </repository>
  <snapshotRepository>
    <id>proj-snapshots</id>
    <name>proj snapshots repository</name>
    <url>http://127.0.0.1/content/repositories/proj-snapshots</url>
  </snapshotRepository>
</distributionManagement>
```
