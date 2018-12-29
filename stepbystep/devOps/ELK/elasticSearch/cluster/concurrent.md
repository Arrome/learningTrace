# 并发冲突

悲观锁&&乐观锁

乐观锁：
1. 用ES内部提供的`_version`来进行并发控制<br>
  只有提供的version和ES中`_version`一样时，可修改，不一样则报错<br>
  例如：
  ```
  PUT /index/type/id?version=1
  {
    "json_data"
  }
  ```
2. external version，基于自己维护的一个版本号来控制<br>
  只有当提供的version比ES中`_version`大时，才能完成修改<br>
  例如：
  ```
  PUT /index/type/id?version=2&version_type=external
  {
    "json_data"
  }
  ```
