必备常识
---
1. 密码安全需重视，root密码定时换
2. 应对故障先恢复再排查，无计可施重启试试
3. 慎防进程进入僵死D状态，及时监控保可用
4. 一人一次只做一个变更，降低人为失误
5. 数据备份任务要监控，并定时检查备份档的有效性
6. 尽量提前预警，避免告警救火
7. 灾难的紧急预案一定要有演练机制，养兵千日用兵一时
8. 运维工作互备，工作交接要留文档
9. 运维的标配软技能：责任心、沟通力、执行力
10. 用流程保证质量，用自动化保证效率

操作备忘
---
11. 对不可逆的删除或修改操作，尽量延迟或慢速执行
12. 批量操作，先灰度再全量
13. 开放外网高危端口须谨慎，网络安全要牢记
14. 变更操作先备份再修改
15. 尽可能保证发布操作能被回滚，并且发布故障要优先回滚

运维小技巧
---
16. root操作须留神，sudo 授权更安全可控
17. 删除操作脚本请交叉检查二次确认
18. 将重复3次以上的操作脚本化
19. crontab写绝对路径，输入输出重定向
20. 修改内核参数须区分一次性修改或随机启动修改
21. 保持应用运行的独立性，防止交叉依赖的程序存在
22. 从每个故障中学习和提高，避免重犯同一个错误
23. 每个偶然的故障背后都深藏着必然的联系，找到问题根源并优化掉
24. 运维规范变现步骤：文档化、工具化、系统化、自动化
25. 日常运维口令：打补丁、传文件、批处理、改配置、包管理、看监控
26. 日志管理使用轮转机制，防止硬盘空间使用率无限增大
27. 先量化管理运维对象，再优化管理运维对象
28. 容量规划牢记从3个角度评估：主机负载、应用性能、业务请求量
29. 保持运维对象的标准化与一致性，如处女座般地梳理并整理生产环境

运维规范
---
30. 配置文件不要写死IP，巧用名字服务解藕更高效
31. 运维脚本和工具要版本化管理
32. 采用高可用的集群化部署，应防止单点
33. 敏感权限应定期回顾和检查，及时清理离职转岗人员权限
34. 服务上线一定要有监控，保证质量可度量
35. 对生产环境执行变更操作后，要有持续关注机制，确保服务质量不受影响
36. 容量管理要做好，每日关注高低负载