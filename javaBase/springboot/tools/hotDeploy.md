# spring-boot-devtool && springloaded && spring-boot-maven-plugin

方式一：spring-boot-devtool
---------

```
<!-- 热部署方法1spring boot devtools 依赖包. -->
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-devtools</artifactId>
   <optional>true</optional>
  <scope>true</scope>
</dependency>

<!-- 构建节点-->
<build>
   <plugins>
       <!-- 这是spring boot devtool plugin 热部署1常用-->
       <plugin>
           <groupId>org.springframework.boot</groupId>
           <artifactId>spring-boot-maven-plugin</artifactId>
           <configuration>
               <!--fork :  如果没有该项配置，这个devtools不会起作用，即应用不会restart -->
               <fork>true</fork>
           </configuration>
       </plugin>
   </plugins>

</build>
```
application.yaml配置：
```
spring:
    devtools:
        restart:
            #热部署生效
          enabled: true
            #设置重启的目录
            #additional-paths: src/main/java
            #classpath目录下的WEB-INF文件夹内容修改不重启
          exclude: WEB-INF/**
```
idea:
1、勾上自动编译或者手动重新编译`File > Settings > Compiler-Build Project automatically`
2、注册 `ctrl + shift + alt + / > Registry > 勾选Compiler autoMake allow when app running`

方式二：springloader
-------

```
<!-- 热部署方法2-->
<dependency>
  <groupId>org.springframework</groupId>
   <artifactId>springloaded</artifactId>
    <version>1.2.4.RELEASE</version>
</dependency>

<build>
 <plugins>
     <!-- 在这里添加springloader plugin  热部署方法2启动： spring-boot:run -->
     <plugin>
           <groupId>org.springframework.boot</groupId>
           <artifactId>spring-boot-maven-plugin </artifactId>
           <dependencies>  
            <dependency>  
                <groupId>org.springframework</groupId>  
                <artifactId>springloaded</artifactId>  
                <version>1.2.4.RELEASE</version>
            </dependency>  
         </dependencies>  
         <executions>  
            <execution>  
                <goals>  
                    <goal>repackage</goal>  
                </goals>  
                <configuration>  
                    <classifier>exec</classifier>  
                </configuration>  
            </execution>  
            </executions>
     </plugin>
  </plugins>
</build>
```
