# PVC

namespace级别<br>

PVC自动绑定合适的PV<br>
**PV和PVC一一对应**（PV被占用不能被其他PVC访问）<br>

pod指定卷挂载：`volumes.persistentVolumeClaim`
