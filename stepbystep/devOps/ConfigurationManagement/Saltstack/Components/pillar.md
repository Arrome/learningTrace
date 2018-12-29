# pillar

存储在master端，存放需要提供给minion的信息<br>

**应用场景**：
1. 敏感信息，每个minion只能访问master分配给自己的pillar信息
2. 变量，差异化信息
3. 其他任何数据
4. 可在target及state中使用

配置使用pillar
-------

1. top file


`salt '*' saltutil.refresh_pillar` 刷新所有minion缓存<br>
