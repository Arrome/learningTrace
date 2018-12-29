#默认数据库information_schema

用于记录一些与元数据或表的模式相关的信息，与其他数据库不一样，在data目录下，并没有为information schema建立文件夹，
这说明，information_schema并不是物理存在的，而是在需要的时候，才会临时创建。
(这就可以解释为什么information_schema库中的表的记录总是无法删除或修改)

PLUGINS表
-----------------
