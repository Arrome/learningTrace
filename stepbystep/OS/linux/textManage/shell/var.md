# 变量

> 注意：shell脚本中定义变量是global的(包括函数中变量，都到shell结束或被显示删除为止)

局部变量
------
关键字： `local`<br>
注意：若同名，shell函数定义的local变量会屏蔽脚本定义的global变量

只读变量
-----
关键字：`readonly`<br>
readonly用来定义只读变量，一旦使用readonly定义的变量在脚本中就不能更改

数组变量
-------
空格分割，或换行分割：例如` array_name=(value1 ... valuen)`或
```
array_name=(
  value1
  ...
  valuen
)
```
