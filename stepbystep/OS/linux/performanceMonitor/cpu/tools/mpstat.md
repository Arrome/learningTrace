#mpstat
>大多linux发行版需要安装`sysstat`包才能使用mpstat,pidstat

mpstat
------
信息保存在`/proc/stat`文件中<br>
多核cpu性能分析工具，监控每个CPU性能指标及所有CPU平均指标，<br>
有助于发现应用中是一些线程比其他线程消耗更多的CPU周期，还是应用中所有线程基本平分CPU周期。<br>
1. usr 执行用户代码时用CPU时间百分比
2. sys 执行内核代码时用CPU时间百分比
3. wt  I/O等待时间的百分比
4. idl CPU空闲时间的百分比