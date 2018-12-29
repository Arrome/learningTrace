# job

master在下发指令消息时，会附带上产生的jid（job id，格式为'%Y%m%d%H%M%S%f'）。master将minion执行结果存放在本地/var/cache/salt/master/jobs目录，默认缓存24小时（修改master配置文件keepjobs选项）<br>
minion在接收指令开始执行时，会在本地的cachedir（默认/var/cache/salt/minion）下的proc目录产生以该jid命名的文件，用于执行过程中master查看当前任务的执行情况。指令执行完毕将结果传送给master后，删除该临时文件


salt-run命令job管理
-----------
`salt-run jobs.active`
`salt-run jobs.list_jobs` 查看执行历史缓存<br>
`salt-run jobs.lookup_jid 20181119104039518978` 重新执行历史缓存中命令

saltutil模块job管理
----------
`salt '*' saltutil.running`
