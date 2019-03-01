# COLLATE 校对规则

建表建库中，使用`COLLATE`：
  * 影响`order by`语句的顺序，
  * 影响`where`条件中大于小于筛选结果，
  * 影响`DISTINCT`,`GROUP BY`,`HAVING`查询结果
  * 影响索引创建（索引为字符类型时）

`COLLATE`排序规则：
   * `_ci`:Case Insensitive 缩写，大小写无关
   * `_cs`:Case Sensitive缩写，大小写敏感

查看支持的COLLATE：`show collation`
