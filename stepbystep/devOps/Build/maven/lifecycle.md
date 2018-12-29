# 生命周期

clean 生命周期
--------------
清理项目：
1. pre-clean 执行一些清理前需要完成的工作
2. clean 清理上一次构建生成的文件   **内置绑定插件**：`maven-clean-plugin:clean`
3. post-clean 执行一些清理后需要完成的工作

default 生命周期
--------------
真正构建时需要执行的所有步骤：
1. validate
2. initialize
3. generate-sources
4. process-sources 处理项目主资源文件，一般来说，对src/main/resources目录内容进行变量替换等工作后，复制到项目输出的主classpath目录中 ,**内置绑定插件**：`maven-resources-plugin:resources`
5. generate-resources
6. process-resources
7. compile 编译项目主源码，一般来说，编译src/main/java目录下的Java文件至项目输出的主classpath目录中 ,**内置绑定插件**：`maven-compiler-plugin:compile`
8. process-classes
9. generate-test-sources
10. process-test-resources 处理项目测试资源文件，一般来说，对src/test/resources目录的内容进行变量替换等工作后，复制到项目输出的测试classpath目录中 ，**内置绑定插件**：`maven-resources-plugin:testResources`
11. generate-test-resources
12. process-test-resources
13. test-compile 编译项目的测试代码，一般来说，编译src/test/java目录下的java文件到项目输出的测试classpath目录中， **内置绑定插件**：`maven-compiler-plugin:testCompile`
14. process-test-classes
15. test 使用单元测试框架运行测试，测试代码不会被打包或部署,**内置绑定插件**：`maven-surefire-plugin:test`
16. prepare-package
17. package 接受编译好的代码，打包成可发布的格式，jar,**内置绑定插件**：`maven-jar-plugin：jar`
18. pre-integration-test
19. integration-test
20. post-integration-test
21. verify
22. install 将包安装到maven本地仓库，供本地其他maven项目使用，**内置绑定插件**：`maven-install-plugin:install`
23. deploy 将最终的包复制到远程仓库，供其他开发人员和maven项目使用,**内置绑定插件**：`maven-deploy-plugin:deploy`

site 生命周期
-------------
建立和发布项目站点，maven基于POM所包含的信息，自动生成一个友好的站点，方便团队交流和发布项目信息
1. pre-site 执行一些在生成项目站点前需要完成的工作
2. site 生成项目站点文档
3. post-site 执行一些在生成项目站点之后需要完成的工作
4. site-deploy 将生成的项目站点发布到服务器上
