# 自动化运维工具对比

|工具|语言|架构|协议|
|---|---|----|---|
|Puppet|Ruby|C/S|HTTP|
|Chef|Ruby|C/S|HTTP|
|Ansible|Python|无client|SSH|
|Saltstack|Python|C/S（可无client）|SSH/ZMQ RAET|

Salt SSH：无需zeroMQ及Agent，支持sudo（目标能和标准salt完成相同功能）
