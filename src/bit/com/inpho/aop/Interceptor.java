package bit.com.inpho.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bit.com.inpho.dto.MemberDto;

public class Interceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDto dto = (MemberDto)request.getSession().getAttribute("login");
		if(dto!=null) {
			if(request.getSession().getAttribute("goPage")!=null) {
				request.getSession().removeAttribute("goPage");
			}
			return true;
		}

		System.out.println("로그인 필요서비스에 로그인 정보가 없습니다");
		request.getSession().setAttribute("goPage", request.getRequestURI());
		response.sendRedirect(request.getContextPath()+"/goLogin");
		return false;
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {	
	}
	
}	
