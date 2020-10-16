package bit.com.inpho.service;

import javax.servlet.http.HttpSession;

import bit.com.inpho.dto.MemberDto;

public interface MemberService {
	
	public boolean regeisterMember(MemberDto member,HttpSession session);
	public boolean confirmId(MemberDto member);
	public boolean doLogin(MemberDto member,HttpSession session);
	public boolean socialLogin(MemberDto member,HttpSession session);
}
