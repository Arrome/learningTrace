# 查询

query string search
---------------------
search参数是以http请求的query string来附带的<br>
（生产较少使用此方式）例如：`GET /index/type/_search?q=name:yagao&sort=price:desc`

query DSL
---------
例如：
```
GET /index/type/_search
{
  "query":{
    "match": {
      "name":"yagao"
    }
  },
  "sort": [
    {"price":"desc"}
  ]
}
```

query filter
-------------
例如：
```
GET /index/type/_search
{
  "query": {
    "bool": {
      "must": {
        "name":"yagao"
      }
    },
    "filter": {
      "range": {
        "price": {
          "gt": 25
        }
      }
    }
  }
}
```

full-text search
---------------
```
GET /index/type/_search
{
  "query": {
    "match": {
      "producer": "yagao producer"
    }
  }
}
```
> producer这个字段，会先杯拆解，建立倒排索引

phrase search
------------
跟全文检索相对应，要求输入的搜索串必须在指定的字段文本中，完全包含一模一样的，才匹配

highlight search
--------------
```
GET /index/type/_search
{
  "query": {
    "match": {
      "producer": "producer"
    }
  },
  "highlight": {
    "fields": {
      "producer": {}
    }
  }
}
