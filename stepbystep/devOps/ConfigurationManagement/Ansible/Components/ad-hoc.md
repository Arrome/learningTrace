# ad-hoc命令(ansible命令行方式)

命令都是并发执行，默认并发数由ansible.cfg中forks值来控制，或`-f`指定并发数<br>
若执行任务时间长的情况，可使用ansible异步执行功能<br>
