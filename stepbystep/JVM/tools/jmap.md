# jmap 获取运行中JVM堆快照 heap dump
堆内对象实例的统计信息，ClassLoader信息以及finalizer队列

`-XX:+HeapDumpOnOutOfMemoryError`参数来让虚拟机出现OOM的时候自动生成dump文件