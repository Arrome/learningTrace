# redis脚本
使用Redis脚本功能自己定义新的命令
1.减少网络开销（网络往返时延）2.原子操作（redis将整个脚本作为一个整体执行，中间不插入其他命令，不会出现竞态条件）3.复用，永久存储在redis中<br>
`redis-cli --eval redis-script.lua`
