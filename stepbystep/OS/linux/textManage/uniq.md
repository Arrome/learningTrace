# uniq
常于sort配合使用<br>
`sort example.txt | uniq` = `sort -u example.txt`
对指定的ASCII文件或标准输入进行唯一性检查，以判断文本文件中重复出现的行。常用于系统排查及日志分析<br>

* 无参数只对相邻的相同行内容去重`uniq example.txt`
* `-c` 参数：计数
