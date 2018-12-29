# 日志配置

**默认配置文件**：$JAVA_HOME/jre/lib/logging.properties <br>
**设置系统属性覆盖默认配置**：`System.setProperty("java.util.logging.config.file","logging.properties");`<br>

>此系统配置应该在`Logger.getLogger(name)`之前<br>

日志配置properties文件
------
* **handlers**:逗号分隔,会被加到root logger中(即使不给其他logger配置handler属性,在输出日志时logger会一直找到root logger,从而找到handler进行日志处理)
* **.level**:root logger日志级别
* **\<handler>.XXX**:配置具体某个handler的属性
* **logger的配置**:
  * **\<package>.level**:例如:com.xyz.foo.level = SEVERE 代表 com.xyz.foo的logger定义级别为SEVERE,由于继承关系com.xyz.foo.web.container没有定义任何属性,也会以此属性输出
  * **<package>.handler**:自定义继承java.util.logging.handler的类
  * **<package>.useParentHandlers**(默认为true):false指日志输出时,日志只被处理一次,用自己handler

**java运行命令指定**:`-Djava.util.logging.config.file=logging.properties`
```
handlers=java.util.logging.FileHandler,java.util.logging.ConsoleHandler  

.level=INFO

java.util.logging.FileHandler.pattern=%h/java%u.log
java.util.logging.FileHandler.limit=50000
java.util.logging.FileHandler.count=1
java.util.logging.FileHandler.formatter=java.util.logging.XMLFormatter

java.util.logging.ConsoleHandler.level=INFO
java.util.logging.ConsoleHandler.formatter=java.util.logging.SimpleFormatter

com.xyz.foo.level=SEVERE
sun.rmi.transport.tcp.logLevel=FINE
```
