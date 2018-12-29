# AtomicInteger,AtomicBoolean，AtomicLong，AtomicReference

原子更新基本类型

volatile变量 和 compareAndSwap算法 来实现原子操作：
* 调用 sun.misc.Unsafe 的 compareAndSwapObject（compareAndSwapInt，compareAndSwapLong）方法完成操作
