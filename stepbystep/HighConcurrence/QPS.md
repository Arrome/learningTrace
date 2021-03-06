# 系统吞吐量（承压能力）

系统吞吐量与request对CPU的消耗、外部接口、IO等紧密关联（单个request对CPU消耗越高，外部系统接口、IO影响速度越慢，系统吞吐能力越低，反之越高）<br>

`QPS（每秒request数） = 并发数（系统同时处理的request数）/响应时间（平均响应时间[请求等待时间，请求处理时间]）`

提高系统QPS
-----------
####增加并发数
1. 增加 tomcat 并发线程数，开启服务器性能匹配的线程数，以更多满足服务请求
2. 增加 DB 连接数，预建立合适数量的 TCP 连接数
3. 后端服务尽量无状态，可以更好支持横向扩展，满足更大流量要求
4. 调用链路上各个系统和服务尽量不要单点，要从头到尾能力对等，不能让其中某一点成为瓶颈
5. RPC 调用的尽量使用线程池，预先建立合适连接数
......

####减少平均响应时间
1. 请求尽量越前结束越好，使压力不要穿透到后面系统上，可在各个层上加上缓存
2. 流量削峰，处理不了的请求直接返回错误或其他提示
3. 减小调用链
4. 优化程序
5. 减少网络开销，适当使用长连接
6. 优化数据库，建立索引
......
