# 核心

ZAB(Zookeeper Atomic Broadcast)原子广播协议
----------
**此机制保证各个Server间的同步**

* 恢复模式(选主)
  服务启动或leader崩溃后，ZAB进入恢复模式<br>
  当leader被选举出且大多数Server完成和leader状态同步后，恢复模式结束
* 广播模式(同步)
  状态同步保证leader和Server具有相同的系统状态

Znode
----------
**两种类型**：
1. 短暂的(ephemeral) `create -e`<br>
  短暂的znode的客户端会话结束时，zookeeper会将该短暂znode删除，短暂znode不可以有子节点
2. 持久的(persistent) `create 不指定-e参数，默认`<br>
  持久znode不依赖客户端会话，只有当客户端明确确定要删除该持久znode时才会被删除

**四种形式目录节点**
1. persistent
2. ephemeral
3. persistent_sequential
4. ephemeral_sequential

> `create -s` znode序列形式，即使重名会添加序列号

####zxid(事务id号)
为保证事务的顺序一致性，zookeeper采用了递增的事务id号(zxid)来标识事务。所有提议(proposal)在被提出时都加上了zxid。<br>
zxid是一个64位数字：1. 高32位是epoch来标识leader关系是否改变，每次一个新的leader被选举出来，都会有一个新的epoch，标识当前属于那个leader的统治时期。2. 低32位用来递增计数(每切换一次leader重新计数)

核心功能 Watcher
-----------------
Watcher可以监控目录节点的数据变化及子目录的变化，一旦这些状态发生变化，服务器就会通知所有设置在这个目录节点上的Watcher，从而每个客户端都很快知道所关注的目录节点的状态发生变化，而做出相应的反应

奇数台搭建集群原因
------------
  依据：投票选举半数以上通过：<br>
  (**为什么需要半数以上**：比如3台机器两台没更新成功，leader挂掉，两台选举将都没有最新数据，而丢失数据)
* 容错角度：3台容错1台，4台容错1台
* 防止脑裂：6台分为3，3脑裂，5台分为1，4或2，3都还能选出leader
