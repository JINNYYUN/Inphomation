package bit.com.inpho.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class LogAop {
	
	@Around("within(bit.com.inpho.controller.*) or within(bit.com.inpho.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint)throws Throwable {		
		String signatureStr = joinpoint.getSignature().toShortString();		
		
		/* 로그인 session check
		HttpServletRequest request
			= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		
		if(request != null) {			
			HttpSession session = request.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");
			if(login == null) {
				return "redirect:/sessionOut.do";
			}
		}*/		
		
		try {						
			System.out.println("loggerAOP:" + signatureStr + " 메소드가 실행되었습니다");
			Object obj = joinpoint.proceed();		
			
			return obj;
			
		}finally {
			
		}		
	}
}









