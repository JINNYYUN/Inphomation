package bit.com.inpho.service;

import javax.servlet.http.HttpSession;

import bit.com.inpho.dto.MemberDto;

public interface MemberService {
	
	
	public boolean confirmId(MemberDto member);
	public boolean doLogin(MemberDto member,HttpSession session);
}
