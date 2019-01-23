# job

多用于执行一次性任务、批处理工作等。

方式：
* 非并行job：通常只运行一个Pod，成功结束Job后就退出
* 固定完成次数的并行job：并行运行指定数量的Pod，直到指定数量的Pod成功，job结束
* 带有工作队列的并行Job：
  * 用户可指定并行Pod数量，当任何Pod成功结束后，不会再创建新的Pod
  * 一旦有一个Pod成功结束，并且所有Pods都结束后，该job就成功结束
  * 一旦有一个Pod成功结束，其他Pods都会准备退出

Job模式
-------
* **基于Job模板扩展**：一个Job对象对应一个待处理的work item，有几个work item就产生几个独立的job <br>
**适用场景：工作项(work item)数量少，每个工作项要处理的数据量比较大的场景**<br>
* **按每个work item排列的队列**：采用一个任务队列存放work item，一个Job对象作为消费者去完成这些work item（Job会启动N个Pod，每个Pod对应一个work item）**所有任务都完成，job才会成功结束（采用消息队列RabbitMQ）**<br>
  根据项目数量填写spec.completions, 并行数量spec.parallelism<br>
* **可变任务数量的队列**：采用一个任务队列存放work item，一个Job对象作为消费者去完成这些work item（Job启动的Pod数量是可变的）**只要其中一个任务成功完成，该job就会成功结束（采用Redis队列，RabbitMQ不能让客户端知道是否没有了数据）**<br>
  spec.completions需要置1， 并行数量spec.parallelism可以根据实际情况填写<br>
