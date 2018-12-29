# 注解
按运行机制划分
-------------
1. 源码注解：只在源码中存在，编译成.class文件就不存在了
2. 编译时注解：源码和.class中都存在，例如：@Override、@Deprecated、@SuppressWarnings...
3. 运行时注解：运行阶段起作用，甚至影响运行逻辑

按来源划分
--------
1. JDK的注解
2. 第三方注解
3. 自定义注解

元注解(注解的注解)
---------------
JDK5定义四个元注解：
  1.@Target
  2.@Retention
  3.@Documented
  4.@Inherited
