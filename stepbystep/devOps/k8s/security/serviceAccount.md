# Service Account

场景：运行在Pod里的进程需要调用kubernets API以及非kubernets API的其他服务。给运行在Pod里的进程提供必要身份证明。<br>
**Pod访问ApiServer方式**：**以Service方式访问服务名为kubernetes的服务（Endpoints指向apiServer）**，kubernetes服务只在HTTPS安全端口上提供服务。<br>
**如果k8s开启了ServiceAccount（`--admission-control=ServiceAccount`）会在每个namespace下创建一个名为 default 的默认的 ServiceAccount对象**，ServiceAccount里有一个名为Tokens的可以当作Volume一样被Mount到Pod里的Secret。(Token Controller检测serviceAccount的创建，并为他们创建secret)当Pod启动时，这个Secret会自动被Mount到Pod的指定目录下，用来协助完成Pod中的进程访问APIService时的身份鉴权过程。<br>
如果Pod定义时没有指定spec.serviceAccountName属性，系统会自动为赋值为 default <br>

apiServer启动参数`--service-account-key-file`用于验证Service Account token，不指定默认使用`--tls-private-key-file` <br>

namespace下新建Pod，如果不指定serviceaccount，会自动挂在当前namespace中默认serviceaccount（default）<br>



Secret（私密凭据）
----------
如果kube-controller-manager进程启动时指定了APIServer私钥`--service-account-private-key-file`，会创建Token Controller<br>
Token Controller监听Service Account事件：
* 监听创建：若发现新创建的Service Account里没有对应Service Account Secret，会用APIServer私钥签发创建一个Token（JWT Token），用该Token、CA证书（AIPServer认证证书）、namespace名称信息产生一个新的Secret，放到刚才ServiceAccount中
* 监听删除：自动删除与该ServiceAccount相关的Secret
Token Controller监听Secret创建、修改、删除事件
