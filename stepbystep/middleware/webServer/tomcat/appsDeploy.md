# appsDeploy

tomcat自动部署
---------------
web应用结构为：`AppName/WEB-INF/*` 放进 `$TOMCAT_HOME/webapps`文件夹下，系统把web应用直接部署到tomcat中

自定义web部署文件
----------------
web应用结构为：`AppName/WEB-INF/*`，在`$TOMCAT_HOME/conf`下新建文件夹(默认位置)`Catalina/localhost`(`conf/<server.xml文件Engine name属性名称>/<server.xml文件Host name属性名称>`，若非默认位置可以在server.xml的Host标签的xmlBase属性设置)并创建 AppName.xml<br>
```
<Context path="/XXX" reloadable="true" docBase="D:\workspace\WebApp\AppName" workDir="D:\workspace\WebApp\work"/>
```
* path ： web应用的虚拟路径名
* docBase ： 部署的web应用的源路径
* workDir : Web应用部署后的工作目录。若自定义未指明，则web应用默认部署在`$TOMCAT_HOME/work/Catalina/localhost`下以应用名命名的文件夹（JSP编译成的servlet）

修改server.xml文件
--------------------
Host标签内配置：<br>
```
<Context docBase="D:\workspace\WebApp\AppName" path="/XXX" debug="0" reloadable="false" />
```
