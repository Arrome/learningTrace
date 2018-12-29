# java.lang.ThreadLocal类（线程封闭）
**概念**：为变量在每个线程中都创建了一个副本，每个线程可以访问自己内部的副本变量<br>
**常见应用场景**：解决 数据库连接、session管理 等

> **注意**：由于每个线程都创建了副本，要考虑对资源的消耗，比如内存占用会比不使用ThreadLocal要大<br>
一般都声明在静态变量中，如果创建ThreadLocal而没有调用remove方法，会导致内存泄露

原理：
Thread 内部通过 ThreadLocal.ThreadLocalMap 来维护 ThreadLocal 变量表<br>
初始化 ThreadLocal的initialValue()方法，来设置当前线程的变量副本
