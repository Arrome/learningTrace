# /etc/gitlab/gitlab.rb

GitLab Unicorn
---------------

```
unicorn['listen'] = '192.168.204.128'
unicorn['port'] = 8080
```

data storing directory
-------------------
仓库默认存储位置：`/var/opt/gitlab/git-data/repositories`<br>
```
git_data_dirs({
    "default" => {
      "path" => "/mnt/nfs-01/git-data"
    }
})
```
