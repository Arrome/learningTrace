# 角色

* 领导者(leader) 负责进行投票的发起和决议，更新系统状态

* 学习者(learner)
  * 跟随者(follower) 用于接受客户端请求并向客户端返回结果，在选举过程中参与投票
  * 观察者(observer) 可以接收客户端连接，将写请求转发给leader，但不参与投票，只同步leader状态。**目的：扩展系统，提高读取效率**(公司较少使用，一般3，5，7，9，11台足够)
* 客户端(client) 发起请求