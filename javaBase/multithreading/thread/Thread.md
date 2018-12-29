# 线程

守护线程：具备自动结束生命周期的特性（一个JVM进程中没有一个非守护线程，JVM会退出）



API
----
* Thread.sleep(long):暂停执行，虽给定了休眠时间，但最终要以系统的定时器和调度器的精度为准。
  * **不会放弃monitor锁的所有权**
  * 只会导致当前线程进入指定时间的休眠
  * **可使用TimeUnit枚举类完全替代**

* Thread.yield():启发式方法，提醒调度器自己愿意放弃当前CPU资源，如果CPU资源不紧张，会忽略这种提醒
  * 使当前线程从Running状态切换到Runnable状态，一般不常用

* Thread.interrupt()

* thread.join()
