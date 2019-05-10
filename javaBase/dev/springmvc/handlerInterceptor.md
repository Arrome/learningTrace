# HandlerInterceptor

自定义拦截器（实现HandlerInterceptor三个方法）

配置在<servlet-name>-servlet.xml
```
<mvc:interceptors>
    <mvc:interceptor>
        <!-- 拦截路径，这里表示拦截所有 -->
        <mvc:mapping path="/**" />
        <bean class="cn.edu.hbue.soft.interceptor.MyInterceptor"></bean>
    </mvc:interceptor>
</mvc:interceptors>
```
