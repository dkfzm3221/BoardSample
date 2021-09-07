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
		
		
		
/*		System.out.println("boardWriter : " +  boardWriter);*/
		
		if(session != null) {
			UserDTO boardWriter = (UserDTO) session.getAttribute("boardWriter");
			/*	response.sendRedirect("/sam/main");*/
				if(boardWriter == null) {
					response.sendRedirect("/sam/login");
					return false;
				}
		}
		
		return true;
	
	}
	
   @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {

        super.postHandle(request, response, handler, modelAndView);
    }
 
/*    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

        super.afterCompletion(request, response, handler, ex);
    }
*/


	
	
	
	
	
}
