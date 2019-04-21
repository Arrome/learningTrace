# rescue 错误处理

```
tasks:
  - block:
      - shell: 'ls /opt'
      - shell: 'ls /testdir'
      - shell: 'ls /c'
    rescue:
      - debug:
          msg: 'I caught an error'
    always：
      - debug：
          msg："this always executes"
```
