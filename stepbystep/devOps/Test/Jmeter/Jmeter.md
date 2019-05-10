# Jmeter ---- Apache 开源
语言：java开发

目录结构：
  * extras 目录下文件提供对ant的支持，可以利用ant实现自动化，例如批量执行脚本，产生html报告等<br>
  运行jmeter会产生一个jtl文件，放到extras目录下，运行ant -Dtest=文件名 report就可以生成测试统计报表
  * lib 目录下ext子目录是jmeter核心jar包，junit子目录是放junit脚本<br>
  用户扩展所依赖的包直接放到lib下，不要放到lib/ext下
