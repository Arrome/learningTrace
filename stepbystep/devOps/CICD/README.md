# CICD

CI(持续集成)
-----------
* **概念**：频繁地（一天多次）将代码集成到主干
* **目的**：让产品可以快速迭代，同时还能保持高质量。
* **核心措施**：代码集成到主干之前，必须通过自动化测试。只要有一个测试用例失败，就不能集成。
* **好处**：
    * 快速发现错误。每完成一点更新，就集成到主干，可以快速发现错误，定位错误也比较容易。
    * 防止分支大幅偏离主干。如果不是经常集成，主干又在不断更新，会导致以后集成的难度变大，甚至难以集成。

持续交付(continuous delivery)
---------------------------
* **概念**：频繁地将软件的新版本，交付给质量团队或者用户，以供评审。如果评审通过，代码就进入生产阶段。
* **强调**：不管怎么更新，软件是随时随地可以交付的。

持续部署(continuous deployment)
---------------------
* **概念**：交付的下一步，指的是代码通过评审以后，自动部署到生产环境。
* **目的**：代码在任何时刻都是可部署的，可以进入生产阶段。