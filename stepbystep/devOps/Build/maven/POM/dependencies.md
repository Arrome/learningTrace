# dependency

```
<dependencies>
  <dependency>
    <groupId></groupId>
    <artifactId></artifactId>
    <version></version>
    <tpye></type>         <!--依赖类型，对应坐标packaging-->
    <scope></scope>       <!--依赖范围-->
    <optional></optional> <!--标记依赖是否可选，使用原因：某一个项目实现了多个特性，特性间是互斥，用户不能同时使用特性。依赖此项目，不会传递依赖可选依赖，需要声明-->
    <exclusions>          <!--排除传递性依赖-->
      <exclusion>
      </exclusion>
    </exclusions>
  </dependency>
</dependencies>
```
type
-----
大部分不必声明，默认jar。<br>

scope
-----
* compile   未指定，默认使用，编译、测试、运行三种classpath都有效
* test      只对测试classpath有效，典型例子：JUnit
* provided  对编译、测试classpath有效，典型例子：servlet-api
* runtime   对于测试、运行classpath有效,典型例子:JDBC驱动接口
* system    对编译、测试classpath有效，使用system范围依赖，必须通过systemPath元素显式指定依赖文件路径。此类依赖不是通过Maven仓库解析，而且往往与本机系统绑定
* import    导入依赖范围，(只能用在dependencyManagement里，仅用于type=pom的dependency)不会对三种classpath产生实际的影响

传递依赖
------
左边为第一直接依赖范围，上边为第二直接依赖范围：

||compile|test|provided|runtime|
|--|---|---|--|---|
|compile|compile|----|----|runtime|
|test|test|---|---|test|
|provided|provided|---|provided|provided|
|runtime|runtime|---|---|runtime|

依赖调解
------
* 原则一：依赖路径最近者优先
* 原则二：原则一优先，依赖路径长度相等，在POM中依赖声明顺序决定谁被解析使用，顺序最靠前的优先

依赖优化
------
引入未使用依赖，未显式声明的依赖，可能造成隐性问题
```
mvn dependency:list
mvn dependency:tree
mvn dependency:analyze
```
