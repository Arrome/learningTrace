# playbook

最核心组件，配置管理工作<br>
`ansible-playbook`<br>

`ansible-playbook xxx.yaml --syntax-check` 检查playbook语法<br>
`ansible-playbook xxx.yaml --list-task` 显示task<br>
`ansible-playbook xxx.yaml --list-hosts` 显示hosts<br>
`ansible-playbook xxx.yaml -C`或`ansible-playbook xxx.yaml --check` 检测模式（dry-run）告诉每个任务是否会修改主机状态，但并不对主机执行实际修改<br>
`ansible-playbook xxx.yaml -D`或`ansible-playbook xxx.yaml --diff` 为任何变更远程主机状态的文件输出差异信息<br>
