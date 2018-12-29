# service 组件

可以看作 Tomcat 内的不同服务的抽象

**包括**：<br>
1. Connector组件
  负责开启 Socket 并监听客户端请求、返回响应数据
2. Engine组件
  表示 整个 Servlet 引擎<br>
  只负责请求处理，并不需要考虑请求链接、协议等的处理
