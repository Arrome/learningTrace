# job类型

MultiBranch Pipeline
-----------------------
* 首先需要在每个分支代码的根目录下存放Jenkinsfile<br>
* jenkins自动地检查所有的branch，为每个branch生成job。(若代码库上某个branch分支被删除，也会自动检测变化并删除相应job)<br>
* 第一次生成Multibranch Pipeline时，会自动扫描pipeline配置文件并建立相应Job，若Jenkins文件有变更，也可手动触发扫描
