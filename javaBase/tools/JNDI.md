# JNDI(Java Naming and Directory Interface,Java命名和目录接口)
JNDI 包含了一些标准API接口，Java程序可以通过这些接口来访问命名目录服务。

#####命名服务
将名字和计算机系统内一个对象建立关联，允许应用程序通过该名字访问该对象

#####目录服务
命名服务拓展，不仅需要保存名称和对象的关联，还要保存对象的各种属性

#####JNDI架构
![JNDI架构](../images/JNDIArch.jpg)

####JNDI API
```
    javax.naming
    javax.naming.directory
    javax.naming.event
    javax.naming.ldap
    javax.naming.spi
```
