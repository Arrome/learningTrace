# CAS

https模式
----------
cas-server-webapp 默认使用https，需要配置证书

解除https限制
-----------
1. `WEB-INF/deployerConfigContext.xml` 的 `proxyAuthenticationHandle` 添加属性 `p:requireSecure="false"`
2. `WEB-INF/spring-configuration/ticketGrantingTicketCookieGenerator.xml` 将 `p:cookieSecure="true"` 改为 `p:cookieSecure="false"`
3. `WEB-INF/spring-configuration/warnCookieGenerator.xml` 将 `p:cookieSecure="true"` 改为 `p:cookieSecure="false"`
