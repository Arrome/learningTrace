# final 修饰符
表示不可变

修饰变量（成员变量，局部变量）
--------
final修饰的普通变量**不能重新赋值，不可被改变**


修饰对象引用
----------
**仅表示变量对对象的引用不可变**(即final修饰的变量只能指向唯一一个对象，不可以再将它指向其他对象)<br>
**而对象本身是可变的**

修饰类
------
final修饰的类**不能被继承，没有子类**<br>
成员方法都默认是final的，成员变量不一定是final的

修饰方法
-------
final修饰的方法**不能被子类重写，但可以被继承**<br>
**不能修饰构造方法**
