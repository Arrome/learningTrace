# HandlerExceptionResolver

根据异常设置ModelAndView（只是用于解析对请求做处理的过程产生的异常，渲染异常不管），之后再交给render方法（只负责将ModelAndView渲染成页面）渲染。
