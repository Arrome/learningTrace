# 状态管理系统

对应配置描述文件为sls（salt state），扩展名为.sls,YAML语言描述

默认使用Jinja2模板引擎

state tree
----------
top file：配置管理入口文件，指定minion需要完成哪些配置管理，默认为top.sls(模块使用点分隔，例如 apache.install 等于 salt://apache/install.sls或者salt://apache/install/init.sls)<br>

Include/Extend:sls文件间可以通过include及extend来引用和扩展<br>

sls中ID必须唯一，且在该ID下同一类的状态管理模块只能有一个<br>

state_auto_order参数（默认为true），使用state在没有requisites的情况下按照从上到下顺序执行<br>


requisites
---------
require：本state执行时需要先执行哪些state<br>
require_in:与require位置相反<br>

watch：除了require外，也会监测依赖的state状态，如果状态发生变化，做出反应<br>
watch_in:与watch位置相反<br>

prereq：会通过test=True接口检查所依赖的state的状态，如果状态发生变化，执行<br>
prereq_in:与prereq位置相反<br>


> 建议逻辑数据分离:sls文件中存放业务逻辑，pillar内存放业务数据
