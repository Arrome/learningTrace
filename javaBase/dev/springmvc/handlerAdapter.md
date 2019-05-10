# HandlerAdapter

* `supports(Object handler);`判断是否可以使用某个Handler
* `ModelAndView handle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception;`直接调用Controller的handler处理方法
* `long getLastModified(HttpServletRequest request,Object handler);` 获取资源最后一次修改的时间
