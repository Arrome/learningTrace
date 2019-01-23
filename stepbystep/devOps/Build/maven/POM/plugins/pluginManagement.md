# pluginManagement

表示插件声明，maven不会加载插件，可以被继承。<br>
一般用在父Pom文件中,提供子pom使用，子pom可覆盖。<br>
父Pom中定义版本后，子模块中直接应用groupId和artifactId,不用指定版本，方便统一管理。<br>
父Pom中pluginManagement不会介入到maven的声明周期，而plugins直接引入plugin，可绑定到maven相关生命周期<br>
```
<pluginManagement>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-source-plugin</artifactId>
            <version>2.1</version>
            <configuration>
                <attach>true</attach>
            </configuration>
            <executions>
                <execution>
                    <phase>compile</phase>
                    <goals>
                        <goal>jar</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</pluginManagement>
```
