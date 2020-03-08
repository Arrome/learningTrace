# feature

Erasure code（使用多块磁盘驱动，MinIO protects data against hardware failures and silent data corruption using erasure code and checksums. ）
可变数量的数据块 + 奇偶校验块 （推荐N/2）
免受多个数据块损坏，容忍多达丢失一半，丢失一半仍能提供文件服务，创建则需要N/2+1
对象级别，同一时间只能恢复一个对象。每个对象单独进行编码，可快速恢复。
MinIO将驱动器分为4、6、8、10、12、14或16个驱动器的擦除编码集。