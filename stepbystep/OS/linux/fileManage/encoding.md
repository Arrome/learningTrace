# 文件编码

查看文件编码
-------------
1. Vim 查看，`:set fileencoding`
2. enca 命令查看，`enca filename`（enca对某些GBK编码的文件识别不是很好，识别时会出现Unrecognized encoding）

文件编码转换
-----------
1. Vim,`:set fileencoding=utf-8`
2. iconv命令, `iconv -f GBK -t UTF-8 file1 -o file2` UTF-8编码文件转GBK编码
3. enconv命令，`enconv -Ｌ zh_CN -x UTF-8 filename` GBK编码文件转换成UTF-8编码
