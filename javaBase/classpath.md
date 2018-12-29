# CLASSPATH
classpath
-----------
指 WEB-INF/classes 和 WEB-INF/lib，访问优先级为：lib > classes
（maven构建项目resource目录，默认是classpath）

classpath 和 classpath*
--------------------
* classpath：只到class路径中查找文件
* classpath*：不仅到classpath下，还包括jar文件中查找

java获取classpath路径方法
------------------------

* 得到当前类class文件的URI
  1. this.getClass().getResource("")

* 得到当前的classpath的绝对路径URI
  1. this.getClass().getResource("/")
  2. this.getClass.getClassLoader().getgetResource("")
  3. ClassLoader.getSystemResource("")
  4. Thread.currentThread().getContextClassLoader().getResource("")

* web应用程序中，得到web应用程序的根目录的绝对URI
  1. servletActionContext.getServletContext().getRealPath("/")

java获取classpath路径下资源
------------------------

1. Bootstrap.class.getResource("name.properties")
2. Bootstrap.class.getResource("/name.properties")
3. Bootstrap.class.getClassLoader().getResource("name.properties")
