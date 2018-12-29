# 命令行参数

命令行参数是由该插件参数的表达式决定的，例如：`${maven.test.skip}`<br>
maven简单重用了Java自带的参数-D（通过命令行设置一个Java系统属性），在准备插件的时候检查系统属性，实现插件参数配置：例如：`-Dmaven.test.skip=true`
