# 自定义链

**解决**：默认链中规则多，不便管理<br>
**注意**：自定义链不能直接使用，需要被默认链引用才能使用<br>


创建自定义链：`iptables -t filter -N chainName`
默认链引用自定义链：`iptables -I INPUT -p tcp --dport 80 -j chainName`

删除自定义链：1.自定义链没有被引用 2.自定义链中没有任何规则<br>
`iptables -X chainName` 删除引用计数为0且不包含任何规则的自定义链<br>
