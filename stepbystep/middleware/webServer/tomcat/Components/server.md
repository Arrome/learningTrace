# server组件

代表整个 Tomcat 的 Servlet 容器，可以看作 Tomcat 运行实例的抽象<br>

**包括**：<br>
1. Listener组件
  提供监听机制，用于Tomcat整个生命周期中对不同事件进行处理
2. GlobalNamingResources组件
  通过JNDI提供统一的命名对象访问接口，使用于整个server
3. ServerSocket组件
  监听某个端口是否有Shutdown命令
4. Service组件（它们互相独立，只是共享一个JVM以及系统类库）

监听器（只要实现LifecycleListener接口）
------------
####AprLifecycleListener 监听器
使用 APR（Apache Portable Runtime）本地库进行优化，通过 JNI 方式调用本地库能大幅提高对静态文件的处理能力<br>
关注于 初始化前和销毁后：
  * tomcat初始化前，监听器尝试初始化APR库，如初始化成功，则使用APR接受客户端请求并处理请求
  * tomcat销毁后，监听器做APR清理工作

####JasperListener监听器
Jasper 是 Tomcat 的 JSP 编译器核心引擎<br>
关注于 WEB启动前：
  * 初始化Jasper

####JreMemoryLeakPreventionListener监听器

####GlobalResourcesLifecycleListener监听器
主要负责实例化 Server 组件里 JNDI 资源的 MBean，提交有JMX 管理
关注于 启动事件和停止事件：
  * 启动时 为 JNDI 创建 MBean
  * 停止时 销毁 MBean

####ThreadLocalLeakPreventionListener监听器


####NamingContextListener监听器
主要负责 Server 组件内全局命名资源在不同生命周期的不同操作
* tomcat启动时 创建命名资源、绑定命名资源
* tomcat停止前 解绑命名资源、反注册MBean
