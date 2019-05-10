# bean

* singleton，只创建该类一个实例，若存在全局变量会影响下次请求该变量的值
* prototype，`@Scope("prototype")`原型，每次调用时会重新创建该类实例，**改变底层（如service层）的对象为原型时，同时改变上层调用层(如controller层)的调用方式，才生效**
* request，
* session，
* global session，
