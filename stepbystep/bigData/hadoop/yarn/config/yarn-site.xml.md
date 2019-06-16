# yarn-site

resourceManager
----------------
#####host
`yarn.resourcemanager.hostname=0.0.0.0`
`yarn.resourcemanager.bind-host`

#####web
`yarn.resourcemanager.webapp.address=${yarn.resourcemanager.hostname}:8088`
`yarn.resourcemanager.webapp.https.address=${yarn.resourcemanager.hostname}:8090`

#####IPC
`yarn.resourcemanager.scheduler.address=${yarn.resourcemanager.hostname}:8030`
`yarn.resourcemanager.resource-tracker.address=${yarn.resourcemanager.hostname}:8031`
`yarn.resourcemanager.address=${yarn.resourcemanager.hostname}:8032`
`yarn.resourcemanager.admin.address=${yarn.resourcemanager.hostname}:8033`


nodemanager
-------------
#####host
`yarn.nodemanager.hostname=0.0.0.0`
`yarn.nodemanager.bind-host`

#####web
`yarn.nodemanager.webapp.address=${yarn.nodemanager.hostname}:8042`
`yarn.nodemanager.webapp.https.address=0.0.0.0:8044`

#####IPC
`yarn.nodemanager.localizer.address=${yarn.nodemanager.hostname}:8040`


`yarn.nodemanager.address=${yarn.nodemanager.hostname}:0`
`yarn.nodemanager.collector-service.address=${yarn.nodemanager.hostname}:8048`


timelineserver
---------
`yarn.timeline-service.enabled=false`

#####host
`yarn.timeline-service.hostname=0.0.0.0`
`yarn.timeline-service.bind-host`

#####web
`yarn.timeline-service.webapp.address=${yarn.timeline-service.hostname}:8188`
`yarn.timeline-service.webapp.https.address=${yarn.timeline-service.hostname}:8190`

#####IPC
`yarn.timeline-service.address=${yarn.timeline-service.hostname}:10200`

webproxy
--------
`yarn.web-proxy.address`
`yarn.web-proxy.principal`
`yarn.web-proxy.keytab`

Federation Router
---------------
#####web
`yarn.router.webapp.address=0.0.0.0:8089`
`yarn.router.webapp.https.address=0.0.0.0:8091`
