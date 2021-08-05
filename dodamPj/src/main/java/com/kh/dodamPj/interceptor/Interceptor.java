package com.kh.dodamPj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.dodamPj.vo.MemberVo;

public class Interceptor  extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션에서 loginVo 값이 있는지 체크
		HttpSession session = request.getSession();
		//세션 이름이  adminLoginVo 인 세션에 로그인 되어있는지 확인하고
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		System.out.println("interceptor: "+ memberVo);
		// 로그인 되어 있지 않다면
		if (memberVo == null) {
			response.sendRedirect("/user/memberLogin");
			return false; // 요청 처리를 중단
		}
		return true; // 요청 처리를 계속함
	}
}
