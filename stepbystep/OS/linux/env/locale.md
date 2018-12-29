# locale

`locale`查看所有LC_\*,语言环境配置在/usr/share/i18n/locales目录下<br>
> **优先级**：LC\_ALL > LC_** > LANG.(LC_ALL强制设定，LANG默认设定值)<br>
> LANG是LC_*的默认值，设置LC\_ALL后，会重置LC_\*各个值，如果不将LC_ALL重置为空，则无法设置LC\_\*的单个值<br>

按照所涉及的使用习惯各个方面分为12类：
1. 语言符号及其分类(LC_CTYPE)
2. 数字(LC_NUMERIC)
3. 比较和习惯(LC_COLLATE)
4. 时间显示格式(LC_TIME)
5. 货币单位(LC_MONETARY)
6. 信息，主要是提示信息，错误信息，状态信息，标题，标签，按钮，菜单等(LC_MESSAGES)
7. 姓名书写方式(LC_NAME)
8. 地址书写方式(LC_ADDRESS)
9. 电话号码书写方式(LC_TELEPHONE)
10. 度量衡表达方式(LC_MEASUREMENT)
11. 默认纸张尺寸大小(LC_PAPER)
12. 对locale自身包含信息的概述(LC_IDENTIFICATION)
