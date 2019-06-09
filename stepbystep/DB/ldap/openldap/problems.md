# 问题

* 问题：`ldap_modify: Invalid syntax (21) additional info: olcSuffix: value #0 invalid per syntax`
  原因：语法问题，可能是用不加双引号

* 问题：报错`tlsmc_cert_create_hash_symlink: ERROR: OS error: Permission denied`
  原因：可能因为 firewalld 或者 SElinux 未关闭
