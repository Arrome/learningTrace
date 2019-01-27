#sed (stream editor)

**适合**：编辑匹配到文本<br>
**原理**：从文本的一个文本行或标准输入中读取数据，将其复制到缓冲区，然后读取命令行或脚本第一个命令，对此命令要求的行号进行编辑，重复此过程，直到命令行或脚本中的所有命令都执行完毕

**pattern出现了‘/’时，可以转义‘/’分隔符，或者使用其他字符作为分隔符(只有替换s时可用其他字符分割)**

增<br>
------
单行，多行`\n`
```
sed '2a content' example.txt 追加
sed '2i content\ncontent' example.txt 前新增
```
删<br>
----
```
sed '2d' example.txt
sed '2,5d' example.txt
sed '2,+3d' example.txt
sed '1~2d' example.txt  以1行开始，步长为2
sed '2,$d' example.txt
sed '/xxx/,$' example.txt
```
改
---
`c`替换指定的行
```
sed '2c content' example.txt
```

查
----
```
sed -n '/b/,/d/p' test.txt
```

`l` 打印特殊字符:`sed -n 'l' example.txt`<br>
`q` 退出：`sed '3q' example.txt`<br>
`r` 追加文件 每行后加文件内容：`sed 'r test.txt' example.txt` 文件合并：`sed '$r test.txt' example.txt`

-----------------------------
文本替换
--------
`s`替换指定的文本<br>
`g`指定全局替换,`w`写文件，`i`忽略大小写，`e`作为命令执行
```
sed 's###g' example.txt
sed '5s###g' example.txt
```

分组替换
------

特殊符号&
---------
```
sed 's#d#--&--#g' example.txt
```

另存文件
-----
`w filename`指定另存为文件<br>
```
sed 's###g w output.txt' example.txt
sed 's###g;w output.txt' example.txt
```

显示行号`sed '=' example.txt`<br>
多行sed命令使用`;`分割`sed 1,2;s###g example.txt`
`{}`含义：`sed '2,4{p;=}' example.txt`

模式空间/保持空间
---------------
`n` 清空当前模式空间，读入下一行（抛弃当前行读入下一行）`sed -n 'n;p' example.txt`<br>
`N` 不清空当前模式空间，读入下一行，中间`\n`拼接 `sed '=' example.txt | sed 'N;s#\n# #g'`
