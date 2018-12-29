# 注解解释器

编译时注解解释器
-------------

运行时注解解释器
-------------
**通过反射API java.lang.reflect包 读取运行时Annotation信息**

* AnnotatedElement 接口代表 目前正在此虚拟机中运行的程序的一个已注解元素
  * 接口方法：
    1. ` <T extends Annotation> getAnnotation(Class<T> annotationClass)`
      如果存在该元素的指定类型的注释，则返回这些注释，否则返回 null
    2. `Annotation[] 	getAnnotations()` 返回此元素上存在的所有注解
    3. `Annotation[] 	getDeclaredAnnotations()` 返回直接存在于此元素上的所有注解
    4. `boolean 	isAnnotationPresent(Class<? extends Annotation> annotationClass)`如果指定类型的注释存在于此元素上，则返回 true，否则返回 false
  * 实现类：
    1. Class ： 类定义
    2. Constructor ： 构造器定义
    3. Field ： 成员变量定义
    4. Method ： 方法定义
    5. Package ： 包定义
