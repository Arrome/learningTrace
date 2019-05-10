# RequestToViewNameTranslator

有的Hander处理完后没有设置View，也没有设置viewName，需要从request获取viewName<br>
`String getViewName(HttpServletRequest request) throws Exception;`<br>
springmvc容器里只可以配置一个RequestToViewNameTranslator，所有获取viewName的规则都要配置进一个文件。
