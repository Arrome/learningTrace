# 数值计算

linux下变量都属于弱变量，没有变量类型概念

方式1：`$[]`
-----------
简单运算
```
x=1
echo $[$x+=1]
```

方式2：`expr`
------------
```
x=1
expr $x + 4
```
注意：表达式间有空格，只进行整数计算，返回值取整返回。

方式3：`((表达式1,表达式2,表达式3))`
----------------
可进行逻辑运算，四则运算，扩展了for，while，if<br>
**双括号内，所有变量不可以加`$`**<br>
`$(())`获取表达式值

方式4：`let`
----------
```
x=1
let x+=1
let "x+=1"
```
注意：let必须是完整算术表达式，即有等号两边，表达式间无空格