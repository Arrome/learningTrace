# 命令行方式

启动tomcat单独应用
----------
`java -classpath C:\Tomcat\bin\bootstrap.jar;C:\Tomcat\common\lib\tools.jar -Dcatalina.home=C:\Tomcat -Dcatalina.base=C:\Tomcat  org.apache.catalina.startup.Bootstrap -config C:\Tomcat\conf\server.xml start`<br>
指定catalina.base
