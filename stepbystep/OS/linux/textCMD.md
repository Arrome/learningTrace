#文本处理命令

awk
---------
逐行读入，以空格为默认分隔符将每行切片，切开的部分进行分析处理。
* `!a[$0]++` 和`！a[$1]++`   
    * `!a[$0]++`可用来去除重复记录行.例如：`awk '!a[$0]++' test.txt`
    * `！a[$1]++` 例如：`awk '！a[$1]++' test.txt` 第一个域(列)相同的多条行记录被删除，只保留重复记录中第一次出现的行记录


sed
---------
sed不在文件中更改

```
sed -i '/test/'d example.txt表示删除example.txt包含test文本的行，-i直接在文本里改
```

grep
---------


cut
----------
* **文本按列拆分,制表符是字段或列的默认定界符**。对于没有定界符的行,会将该行照原样打印出来。
如果不想打印出这种不包含定界符的行,则可以使用 cut 的 -s 选项
* 不依赖定界符,但需要通过将字段定义为一个字符范围(行首记为0)来进行字段
提取