package com.tool;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 拦截器_用于记录日志
 */
public class MyInterceptors implements HandlerInterceptor {
	/**
	 * 在渲染视图之后被调用； 可以用来释放资源
	 */
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		//System.out.println("1111111111111111111111");
	}

	/**
	 * 该方法在目标方法调用之后，渲染视图之前被调用； 可以对请求域中的属性或视图做出修改
	 * 
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		//System.out.println("22222222222222222222222");
	}

	/**
	 * 拦截器 用于记录日志
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		try{
			String url = request.getRequestURI();
			//设置查询日志方法 本身不要记录日志
//			if(url.indexOf("query_Log")<0){
//				if(null!=request.getSession().getAttribute("user")){
//					
//				}
//			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return true;

	}

}
