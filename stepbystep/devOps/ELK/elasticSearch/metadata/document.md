#

`_index`元数据
----------------
代表一个document存放在哪个index中，一个index放在一个shard，提升访问性能<br>
一个index中包含很多类似的document<br>
类似的数据放在一个index中，非类似的数据放在不同index中（document的field大多相似）<br>
索引名称必须是小写，不能以下划线开头，不能包含逗号<br>

`_type`元数据
-----------
代表document属于index中的哪个类别<br>
一个索引通常会划分为多个type，逻辑上对index分为几类数据<br>
名称可以是大写或小写，不能以下划线开头，不能包含逗号<br>

`_id`元数据
---------
代表document的唯一标识
可手动指定document的id，也可不指定，由ES自动创建一个id

> 手动指定使用场景：一般，从其他系统中导入一些数据到ES时，会采用此方式。即使用系统中已有数据的唯一标识作为ES中document的id。（例如：数据库主键）<br>
自动生成使用场景：ES主要作为存储，无id<br>
 结构：(自动生成的id，长度为20个字符，URL安全，base64编码，GUID，分布式系统并行生成保证不发生冲突)
 ```
POST /index/type
{
  json_data
}
 ```

`_source`元数据
------------
创建document时，request body中json串，默认完整返回<br>
指定返回字段，例如`GET /index/type/id?_source=field1,field2`

`_version`元数据
-------------
第一次创建一个document，`_version`版本号为1<br>
每次对document修改或者删除，都会对`_version`版本号自动加1<br>
乐观锁修改，例如：
```
PUT /index/type/id?version=1
{
  "json_data"
}
```
