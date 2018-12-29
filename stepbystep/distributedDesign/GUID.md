#全局唯一ID生成

UUID
----
* 表现形式：32位16进制格式字符串以及4个短线<br>
* 字节长度：UUID为16byte，即128bit长的数字（一字节=8位二进制=2位十六进制）
* 算法核心思想：结合机器网卡、当地时间、随机数生成UUID。理论上讲一台机器每秒钟产生10000000个GUID，保证(概率上)3240年不重复
* 优点：
     1. 本地生成ID，不需要远程调用时延低
     2. 扩展性好，基本无性能上线
* 缺点：
    1. 相对过长
    2. 无序，作为主键建立索引查询效率低。<br>
        常见优化方案：1. 转化为两个uint64整数存储
                    2. 折半存储(折半后不能保证唯一性)

mysql自增长ID(auto_increment)
----------------------------

各中间件(zookeeper|redis|mongodb...)生成ID
----------------------------------------

SnowFlake(分布式ID生成算法)
-------------------------
* 表现形式：
    * 第一位：占1bit，值为0,无意义
    * 时间戳：占41bit，精确到秒，总共可容纳约69年时间
    * 工作机器ID：占10bit，高位5bit是数据中心ID(datacenterID),低5bit是工作节点ID(workerId),最多容纳1024个节点
    * 序列号：占12bit，在统一毫秒同一节点上从0开始累加，最多累加到4095<br>
 *同一毫秒ID数量 = 1024 * 4096 = 4194304，即四百万 绝大多数并发场景都是足够的
* 字节长度：long型，8字节(64bit)
* 优点：
    1. 生成ID不依赖DB，完全由内存生成，高性能高可用
    2. ID呈递增趋势，后续插入索引树性能较好
* 缺点：
    1. 依赖系统时钟的一致性，如果某台机器系统时钟回拨，可能造成ID冲突或乱序

* 算法描述java：
  ```
    package other;
    
    import java.util.concurrent.ExecutorService;
    import java.util.concurrent.Executors;
    
    public class SnowFlakeIdGenerator {
        //初始时间截 (2017-01-01)
        private static final long INITIAL_TIME_STAMP = 1483200000000L;
        //机器id所占的位数
        private static final long WORKER_ID_BITS = 5L;
        //数据标识id所占的位数
        private static final long DATACENTER_ID_BITS = 5L;
        //支持的最大机器id，结果是31 (这个移位算法可以很快的计算出几位二进制数所能表示的最大十进制数)
        private static final long MAX_WORKER_ID = ~(-1L << WORKER_ID_BITS);
        //支持的最大数据标识id，结果是31
        private static final long MAX_DATACENTER_ID = ~(-1L << DATACENTER_ID_BITS);
        //序列在id中占的位数
        private final long SEQUENCE_BITS = 12L;
        //机器ID的偏移量(12)
        private final long WORKERID_OFFSET = SEQUENCE_BITS;
        //数据中心ID的偏移量(12+5)
        private final long DATACENTERID_OFFSET = SEQUENCE_BITS + SEQUENCE_BITS;
        //时间截的偏移量(5+5+12)
        private final long TIMESTAMP_OFFSET = SEQUENCE_BITS + WORKER_ID_BITS + DATACENTER_ID_BITS;
        //生成序列的掩码，这里为4095 (0b111111111111=0xfff=4095)
        private final long SEQUENCE_MASK = ~(-1L << SEQUENCE_BITS);
        //工作节点ID(0~31)
        private long workerId;
        //数据中心ID(0~31)
        private long datacenterId;
        //毫秒内序列(0~4095)
        private long sequence = 0L;
        //上次生成ID的时间截
        private long lastTimestamp = -1L;
        
        /**
         * 构造函数
         *
         * @param workerId     工作ID (0~31)
         * @param datacenterId 数据中心ID (0~31)
         */
        public SnowFlakeIdGenerator(long workerId, long datacenterId) {
            if (workerId > MAX_WORKER_ID || workerId < 0) {
                throw new IllegalArgumentException(String.format("WorkerID 不能大于 %d 或小于 0", MAX_WORKER_ID));
            }
            if (datacenterId > MAX_DATACENTER_ID || datacenterId < 0) {
                throw new IllegalArgumentException(String.format("DataCenterID 不能大于 %d 或小于 0", MAX_DATACENTER_ID));
            }
            this.workerId = workerId;
            this.datacenterId = datacenterId;
        }
    
        /**
         * 获得下一个ID (用同步锁保证线程安全)
         *
         * @return SnowflakeId
         */
        public synchronized long nextId() {
            long timestamp =  System.currentTimeMillis();
            //如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过这个时候应当抛出异常
            if (timestamp < lastTimestamp) {
                throw new RuntimeException("当前时间小于上一次记录的时间戳！");
            }
            //如果是同一时间生成的，则进行毫秒内序列
            if (lastTimestamp == timestamp) {
                sequence = (sequence + 1) & SEQUENCE_MASK;
                //sequence等于0说明毫秒内序列已经增长到最大值
                if (sequence == 0) {
                    //阻塞到下一个毫秒,获得新的时间戳
                    timestamp = tilNextMillis(lastTimestamp);
                }
            }
            //时间戳改变，毫秒内序列重置
            else {
                sequence = 0L;
            }
            //上次生成ID的时间截
            lastTimestamp = timestamp;
            //移位并通过或运算拼到一起组成64位的ID
            return ((timestamp - INITIAL_TIME_STAMP) << TIMESTAMP_OFFSET)
                    | (datacenterId << DATACENTERID_OFFSET)
                    | (workerId << WORKERID_OFFSET)
                    | sequence;
        }
    
    
        /**
         * 阻塞到下一个毫秒，直到获得新的时间戳
         *
         * @param lastTimestamp 上次生成ID的时间截
         * @return 当前时间戳
         */
        protected long tilNextMillis(long lastTimestamp) {
            long timestamp = System.currentTimeMillis();
            while (timestamp <= lastTimestamp) {
                timestamp = System.currentTimeMillis();
            }
            return timestamp;
        }
        
        public static void main(String[] args) {
            final SnowFlakeIdGenerator idGenerator = new SnowFlakeIdGenerator(1, 1);
            //线程池并行执行10000次ID生成
            ExecutorService executorService = Executors.newCachedThreadPool();;
            for (int i = 0; i < 10000; i++) {
                executorService.execute(new Runnable() {
                    public void run() {
                        long id = idGenerator.nextId();
                        System.out.println(id);
                    }
                });
            }
            executorService.shutdown();
        }
    }
  ```
