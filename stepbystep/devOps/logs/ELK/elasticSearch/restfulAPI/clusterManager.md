# 集群健康状况

`GET _cat/health?v` 检查集群健康状况<br>
1. green:每个索引的primary shard和replica shard都是active状态的
2. yellow：每个索引的primary shard都是active状态的，但部分replica shard不是active状态，处于不可用状态
3. red：不是所有索引的primary shard都是active状态，部分索引有数据丢失

`GET _cat/indices?v` 查看集群中索引

`PUT /test_index?pretty` 创建索引
`DELETE /test_index` 删除索引

新增文档，建立索引（强制创建加`_create`）
```
PUT /index/type/id
{
  "json_data"
}
```
> ES会自动建立index和type，不需要提前创建，而且ES会默认对document的每个field都建立倒排索引，让其可以被搜索

查询，检索文档
`GET /index/type/id`

修改，替换文档(原document标记为deleted，然后新增，在ES数据较多，会自动删除标记deleted的document)
```
PUT /index/type/id
{
  "json_data"
}
```
> 替换文档，需要包含所有json的数据

修改，更新文档（内置乐观并发锁，retry策略）
```
POST /index/type/id/_update
{
  "json_data"
}
```

删除，删除文档（非物理删除，标记为deleted）
`DELETE /index/type/id`
