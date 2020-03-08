#!/bin/bash

###config
```
mc config host add <host_alias> <host_address> <ak> <secret>
```

###mb && rb
```
mc mb <host_alias>/<bucket_name>
mc rb --force <host_alias>/<bucket_name>
```

###ls && tree
```
mc ls <host_alias> --incomplete
mc tree <host_alias> --files 
```

###cat && head && 
```
mc cat <host_alias>/<bucket_name>/<file_name>
```

###sql
```

```

###lock
```

```

