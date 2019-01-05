# 查看redis内存信息
命令：`redis-cli info`
```
# Memory
used_memory:1635352               Redis分配器分配的内存总量，就是内部存储的所有数据内存占用量
used_memory_human:1.56M           以可读的格式返回used_memory
used_memory_rss:1839104           以操作系统的角度显示Redis进程占用的物理内存总量
used_memory_rss_human:1.75M       以可读的格式返回used_memory_rss
used_memory_peak:1635352          内存使用的峰值
used_memory_peak_human:1.56M      以可读的格式返回used_memory_peak
used_memory_peak_perc:101.35%
used_memory_overhead:1417692
used_memory_startup:507920
used_memory_dataset:217660
used_memory_dataset_perc:19.31%
total_system_memory:3721830400    系统可用内存总量
total_system_memory_human:3.47G   以可读的格式返回total_system_memory
used_memory_lua:37888             lua引擎消耗的内存总量
used_memory_lua_human:37.00K      以可读的格式返回used_memory_lua
maxmemory:0                       Redis最大可用内存，0表示对Redis的内存使用没有限制（由OS物理内存大小决定）
maxmemory_human:0B                以可读的格式返回maxmemory
maxmemory_policy:noeviction       达到最大可用内存时使用的淘汰策略
mem_fragmentation_ratio:1.12      used_memory_rss/used_memory比值，标识碎片率
mem_allocator:jemalloc-4.0.3      Redis使用的内存分配器，默认是jemalloc
active_defrag_running:0
lazyfree_pending_objects:0
```
>当mem_fragmentation_ratio>1时，说明used_memory_rss-used_memory多出的部分内存并没有用于数据存储，而是被内存碎片所消耗，如果两者相差很大，说明碎片率严重。<br>
>当mem_fragmentation_ratio<1时，这种情况一般出现在操作系统把Redis内存交换（Swap）到硬盘导致，出现这种情况时要格外关注，由于硬盘速度远远慢于内存，Redis性能会变得很差，甚至僵死
