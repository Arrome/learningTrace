# log4j 日志配置

配置文件默认放在：classpath路径下log4j.properties
未在classpath路径下：`PropertyConfigurator.configure("src/log.properties");`

配置Log4j环境就是配置root Logger，其他Logger继承root Logger的性质

* 配置根Logger，appenderName指日志信息输出目的地<br>
例如：`log4j.rootLogger = [level],appenderName,appenderName2,...`<br>  
* 配置日志信息输出目的地Appender及其属性<br>例如：
  `log4j.appender.appenderName = org.apache.log4j.ConsoleAppender`
* 配置日志信息格式布局<br>例如：`log4j.appender.appenderName.layout = org.apache.log4j.SimpleLayout`
* 制定特定包输出特定的级别<br>
格式为：`log4j.logger.packageName[.ClassName]=level[,appender]`<br>
例如：`log4j.logger.org.springframework=DEBUG`

```
log4j.rootLogger =ALL,systemOut,logFile

#输出到控制台
log4j.appender.systemOut = org.apache.log4j.ConsoleAppender
log4j.appender.systemOut.layout = org.apache.log4j.PatternLayout
log4j.appender.systemOut.layout.ConversionPattern = [%-5p][%-22d{yyyy/MM/dd HH:mm:ssS}][%l]%n%m%n
log4j.appender.systemOut.Threshold = DEBUG
log4j.appender.systemOut.ImmediateFlush = TRUE
log4j.appender.systemOut.Target = System.out

#输出到文件
log4j.appender.logFile = org.apache.log4j.FileAppender
log4j.appender.logFile.layout = org.apache.log4j.PatternLayout
log4j.appender.logFile.layout.ConversionPattern = [%-5p][%-22d{yyyy/MM/dd HH:mm:ssS}][%l]%n%m%n
log4j.appender.logFile.Threshold = DEBUG
log4j.appender.logFile.ImmediateFlush = TRUE
log4j.appender.logFile.Append = TRUE
log4j.appender.logFile.File = ../Struts2/WebRoot/log/File/log4j_Struts.log
log4j.appender.logFile.Encoding = UTF-8
```

Log4J采用类似C语言中的printf函数的打印格式格式化日志信息，打印参数如下：
----
```
 %m 输出代码中指定的消息
 %p 输出优先级，即DEBUG,INFO,WARN,ERROR,FATAL
 %r 输出自应用启动到输出该log信息耗费的毫秒数
 %c 输出所属的类目,通常就是所在类的全名
 %t 输出产生该日志事件的线程名
 %n 输出一个回车换行符，Windows平台为“\r\n”，Unix平台为“\n”
 %d 输出日志时间点的日期或时间，默认格式为ISO8601，也可以在其后指定格式
    如：%d{yyyy年MM月dd日 HH:mm:ss,SSS}，输出类似：2012年01月05日 22:10:28,921
 %l 输出日志事件的发生位置，包括类目名、发生的线程，以及在代码中的行数
    如：Testlog.main(TestLog.java:10)
 %F 输出日志消息产生时所在的文件名称
 %L 输出代码中的行号
 %x 输出和当前线程相关联的NDC(嵌套诊断环境),像java servlets多客户多线程的应用中
 %% 输出一个"%"字符

 可以在%与模式字符之间加上修饰符来控制其最小宽度、最大宽度、和文本的对齐方式。如：
  %5c: 输出category名称，最小宽度是5，category<5，默认的情况下右对齐
  %-5c:输出category名称，最小宽度是5，category<5，"-"号指定左对齐,会有空格
  %.5c:输出category名称，最大宽度是5，category>5，就会将左边多出的字符截掉，<5不会有空格
  %20.30c:category名称<20补空格，并且右对齐，>30字符，就从左边交远销出的字符截掉
```
