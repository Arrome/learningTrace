# java.lang.annotation

interface接口(@interface)
------------------
* 使用@interface自定义注解时，**自动继承了java.lang.annotation.Annotation接口**，由编译程序自动完成其他细节<br>
* **自定义注解时，不能继承其他的注解或接口**

元注解
--------
####@Target
作用：描述注解使用范围<br>
取值：(枚举类 ElementType)
  1. CONSTRUCTOR:构造器声明
  2. FIELD:字段声明(包括枚举常量)
  3. LOCAL_VARIABLE:局部变量声明
  4. METHOD:方法声明
  5. PACKAGE:包声明
  6. PARAMETER:参数声明
  7. TYPE:用于描述类、接口(包括注解类型)或enum声明
  8. ANNOTATION_TYPE:注解类型声明
####@Retention
作用：描述注解生命周期(什么范围内有效)<br>
取值：(枚举类 RetentionPolicy)
  1. SOURCE: 源文件中有效（即源文件保留）
  2. CLASS: class文件中有效（即class保留）
  3. RUNTIME: 运行时有效（即运行时保留，因此可反射读取属性值，做一些运行时逻辑处理）
####Documented
**标记注解，没有成员**

作用：

####@Inherited
**标注注解，没有成员**

作用：声明被标注的类型是被继承的

注意：
* @Inherited 是被标注过的class的子类继承(类并不从实现的接口继承注解，方法并不从它重载的方法继承注解)
* @Inherited 标注的注解的Retention是RetentionPolicy.RUNTIME,反射API增强了这种继承性
* 使用反射查 @Inherited 类型注解时：检查class和其父类，直到发现注解类型被发现，或者到达类继承结构的顶层


自定义注解
--------
* @interface用来声明一个注解
* 每一个方法实际上是声明了一个配置参数(方法的名称就是参数的名称，返回值类型就是参数的类型)
* default来声明参数的默认值

**Annotation类型里面的参数设定**:
  1. **只能用public或默认(default)这两个访问权修饰**.　 　
  2. 参数成员只能用基本类型byte,short,char,int,long,float,double,boolean八种基本数据类型和 String,Enum,Class,annotation数据类型,以及这一些类型的数组.　(**非基本类型的的注解元素值不可为空**，定义注解时指定默认值或使用注解时指定，**常用做法：空字符串或0作为默认值**)
  3. 如果只有一个参数成员,最好把参数名称设为"value",后加小括号.
