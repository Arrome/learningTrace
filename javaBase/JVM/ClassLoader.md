# 类加载器

JDK默认提供了ClassLoader：
1. 引导类加载器（Bootstrp Loader）：C++语言，java虚拟机启动后初始化的，它**负责加载%JAVA_HOME%/jre/lib**<br>
 `-Xbootclasspath`参数指定的路径以及%JAVA_HOME%/jre/classes中的类。<br>
 以Java来看，逻辑上并不存在bootstrapLoader的类实体，java代码打印内容会输出null
2. 扩展类加载器（ExtClassLoader）：bootstrpLoader加载ExtClassLoader，并将ExtClassLoader的父加载设置为BootstrpLoader<br>
  ExtClassLoader是Java类，`sun.misc.Launcher$ExtClassLoader`<br>
  主要**加载%JAVA_HOME%/jre/lib/ext，此路径下所有classes目录以及java.ext.dir系统变量指定的路径中的类库**
3. 系统类加载器（AppClassLoader）：BootstrpLoader加载完ExtClassLoader后，加载AppClassLoader，且将AppClassLoader的父加载器指定为ExtClassLoader<br>
  AppClassLoader是Java类，`sun.misc.Launcher$AppClassLoader`<br>
  **AppClassLoader负责加载classpath所指定的位置的类或jar**，`ClassLoader.getSystemClassLoader`方法返回AppClassLoader

自定义类加载器
--------------
1. 继承java.lang.ClassLoader类
2. 重写findClass方法（loadClass方法实现搜索类的算法，当搜索不到类时，loadClass方法调用findClass方法搜索类，所以只需要重写该方法）
