# 局部内部类

* **概念**：定义在方法中的内部类

注意：
------------
* **内部类不能被public、private、static修饰**
* 在外部类不能创建内部类实例，内部类实例只能包含在他方法中，且访问必须在内部类定义之后
* **内部类访问包含他的方法中的变量必须有final修饰**
* **局部内部类可随意访问外部类成员变量和方法，即使是私有的。同名变量和方法，需要通过Outer.this方式来引用外部类成员和方法**
