# assert模块
指定条件不符合时，返回错误并失败退出

```
- name: assert that eth1 interface exists
  assert:
    that: ansible_eth1 is defined
```

```
- name: stat /opt/foo
  stat: path=/opt/foo
  register: st
- name: assert that /opt/foo is a directory
  assert:
    that: st.stat.isdir
```
