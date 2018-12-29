# 插件
plugin元素在 <project><build><plugins>下
往往一个插件聚集了多个功能，每个功能就是一个插件目标（goal），例如：dependency:list,surefire:test,compiler:compile

maven-compiler-plugin
------------------
Since 3.0, the default compiler is javax.tools.JavaCompiler (if you are using java 1.6) and is used to compile Java sources. If you want to force the plugin using javac, you must configure the plugin option forceJavacCompilerUse.Also note that at present the default source setting is 1.6 and the default target setting is 1.6, independently of the JDK you run Maven with.
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.1</version>
    <!--插件的全局配置，所有基于该插件目标的任务都会使用这些配置-->
    <configuration>
        <source>1.8</source> <!-- 源代码使用的开发版本 -->
        <target>1.8</target> <!-- 需要生成的目标class文件的编译版本 -->
        <!-- 一般而言，target与source是保持一致的，但是，有时候为了让程序能在其他版本的jdk中运行(对于低版本目标jdk，源代码中需要没有使用低版本jdk中不支持的语法)，会存在target不同于source的情况 -->
        <encoding>UTF-8</encoding>

        <!-- 这下面的是可选项 -->
        <meminitial>128m</meminitial>
        <maxmem>512m</maxmem>
        <fork>true</fork> <!-- fork is enable,用于明确表示编译版本配置的可用 -->
        <executable><!-- path-to-javac --></executable>
        <compilerVersion>1.8</compilerVersion>

        <!-- 这个选项用来传递编译器自身不包含但是却支持的参数选项 -->
        <compilerArgument>-verbose -bootclasspath ${java.home}\lib\rt.jar</compilerArgument>

    </configuration>
</plugin>
```

maven-shade-plugin
---------------
生成可执行的jar文件，打包时信息放到MANIFEST中，构建后在target会出现两个jar（可运行jar，原始jar）
```
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-shade-plugin</artifactId>
  <version>3.1.1</version>
  <configuration>
    <!-- put your configurations here -->
  </configuration>
  <executions>
    <execution>
      <phase>package</phase>
      <goals>
        <goal>shade</goal>
      </goals>
      <configuration>
        <transformers>
          <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
            <mainClass>Main</mainClass>
          </transformer>
        </transformers>
      </configuration>
    </execution>
  </executions>
</plugin>
```
