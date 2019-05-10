#

优先级由高到低：
```
1、开发者工具 `Devtools` 全局配置参数；
2、单元测试上的 `@TestPropertySource` 注解指定的参数；
3、单元测试上的 `@SpringBootTest` 注解指定的参数；
4、命令行指定的参数，如 `java -jar springboot.jar --name="Java技术栈"`；
5、命令行中的 `SPRING_APPLICATION_JSONJSON` 指定参数, 如 `java -Dspring.application.json='{"name":"Java技术栈"}' -jar springboot.jar`
6、`ServletConfig` 初始化参数；
7、`ServletContext` 初始化参数；
8、JNDI参数（如 `java:comp/env/spring.application.json`）；
9、Java系统参数（来源：`System.getProperties()`）；
10、操作系统环境变量参数；
11、`RandomValuePropertySource` 随机数，仅匹配：`ramdom.*`；
12、JAR包外面的配置文件参数（`application-{profile}.properties（YAML）`）
13、JAR包里面的配置文件参数（`application-{profile}.properties（YAML）`）
14、JAR包外面的配置文件参数（`application.properties（YAML）`）
15、JAR包里面的配置文件参数（`application.properties（YAML）`）
16、`@Configuration`配置文件上 `@PropertySource` 注解加载的参数；
17、默认参数（通过 `SpringApplication.setDefaultProperties` 指定）；
```
