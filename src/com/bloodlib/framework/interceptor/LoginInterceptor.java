package com.bloodlib.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登陆拦截器（未登录跳转到登陆界面）
 * 
 * @author WeiBang Kong
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		String path1=request.getPathInfo();
		//如果session内数据为空
		if(path1.contains("login")){
			return true;
		}else if(path1.contains("regist")){
			return true;
		}else if(path1.contains("mainindex")){
			return true;
		}else{
			HttpSession session=request.getSession(false);
			try {
				//如果是请求数据放行
				if(request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
					return true;
				}
				String userId = session.getAttribute("userId").toString();
			} catch (Exception e) {
				String path=request.getContextPath();
				response.sendRedirect(path+"/app/login/index");
				return false;
			}
			return true;
		}
	}

}
