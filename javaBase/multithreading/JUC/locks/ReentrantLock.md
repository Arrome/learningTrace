# ReentrantLock

**可重入锁概念**：递归锁，指同一线程 外层函数 获得锁以后，内层递归函数仍然有获取该锁的代码，不受影响<br>

**作用**：避免死锁<br>

**实现原理**：一种自旋锁，通过循环调用CAS操作来实现加锁。（避免线程进入内核态的阻塞状态）<br>
**独有特性，使用场景**：
1. 可指定公平锁和非公平锁（synchronized只能是非公平锁）
2. 提供了一个Condition类，实现分组需要唤醒的线程（synchronized要么随机唤醒一个，要么唤醒全部）
3. 提供了一种中断等待锁的线程机制，通过lock.lockInterruptibly()实现

独占锁<br>

内部类 Sync、NonfairSync、FairSync 继承 AbstractQueuedSynchronizer<br>



公平锁和非公平锁
--------------
