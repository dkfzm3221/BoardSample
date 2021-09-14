package com.itkey.sam.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itkey.sam.board.dto.UserDTO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("id");
		Object adminObj = session.getAttribute("adminId");
		
		System.out.println("admin : " + adminObj);
		System.out.println("user : " + obj);
		
		if(obj == null && adminObj == null) {
			
			response.sendRedirect("/sam/login");
			return false;
		}
		 
/*		if(obj != null && adminObj == null) {
			response.sendRedirect("/sam/login");
			return false;
		}*/
	
		return true;

	}
	
   @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

        super.postHandle(request, response, handler, modelAndView);
    }

	
}
