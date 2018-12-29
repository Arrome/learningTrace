#CPU

总核数=物理CPU个数*每颗物理CPU核数<br>
总逻辑数=物理CPU个数*每颗物理CPU核数*超线程数
（CPU支持超线程技术：使执行资源扩大一倍，大幅提高系统整体性能）

查看物理CPU个数：`cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l` <br>
查看每个物理CPU中core的个数（核数）：`cat /proc/cpuinfo| grep "cpu cores"| uniq` <br>
查看逻辑CPU个数：`cat /proc/cpuinfo| grep "processor"| wc -l`
