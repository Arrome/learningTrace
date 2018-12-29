# 匹配targeting，指定目标主机

Globing
---------
默认匹配规则<br>
例如：`salt '*' test.ping`<br>
  `salt '*.example.com' test.ping`<br>
  `salt 'web[1-5]' test.ping`<br>
  `salt 'web[1,3]' test.ping`

正则表达式
---------
例如：`salt -E 'web1-(prod|dev)' test.ping`

List
----
指定需要运行指令的minion列表<br>
例如：`salt -L 'web1,web2,web3' test.ping`

grains
-------
通过minion的grains信息来进行匹配<br>
例如：`salt -G 'os:CentOS' test.ping`

pillar
-------
通过pillar来匹配需要运行指令的
例如：`salt -I 'roles:web' test.ping`

Node Groups
------------
**配置文件中配置**，默认在`master.d/*.conf`
例如：`salt -N 'web-cluster' test.ping`

compound
--------
混搭方式<br>
例如：`salt -C 'web* and G@os:CentOS' test.ping`

|letter|match type|example|
|------|----------|-------|
|G|Grains glob|G@os:CentOS|
|E|PCRE minion ID|E@web\d+\.loc|
|P|grains PCRE||
|L|list of minions|web1,web2,web3|
|I|pillar glob||
|S|subnet/IP address|S@192.168.42.59 or S@192.168.42.149|
|R|range cluster|R@%foo.bar|

batch size
----------
通过 -b(--batch-size)指定同时运行的minion数目，一旦一个minion执行完成，则立即新增一个minion运行<br>
例如：`salt '*' -b 10 test.ping`<br>
`salt -N 'web-cluster' -b 20% service.restart apache` 每次重启20%的web-cluster集群minion上的apache
