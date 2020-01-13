package com.lhj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	
	private static final Logger logger= LoggerFactory.getLogger(LoginInterceptor.class);
	
	/*
	 * preHandle : 컨트롤러가 호출되기 전에 실행
	 * postHandle : 컨트롤러가 호출된 후에 실행
	 */
	
	//로그인 한 후
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler , ModelAndView modelAndView ) throws Exception{
		
		HttpSession session = request.getSession();
		
		Object userVO = modelAndView.getModel().get("userVO");
		System.out.println("userVO="+userVO);
		if(userVO !=null) { //사용자의 정보가 있다면 HttpSession에 로그인 처리
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO); //세션에 회원 정보 저장
			response.sendRedirect("../"); //로그인 성공한 후 메인으로 이동
		}
	}
	
	//로그인 하기 전
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) !=null) { //기존에 로그인 했엇다면 로그인 정보 삭제
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	
}
