package bit.com.inpho.service;

import javax.servlet.http.HttpSession;

import bit.com.inpho.dto.MemberDto;

public interface MemberService {
	
	public boolean regeisterMember(MemberDto member, HttpSession session) throws Exception;
	public boolean confirmId(MemberDto member);
	public MemberDto confirmAuthKey(MemberDto member);
	public String doLogin(MemberDto member,HttpSession session) throws Exception;
	public boolean socialLogin(MemberDto member,HttpSession session);
	public boolean idActive(MemberDto member,HttpSession session);
	public void reActiveId(MemberDto member, HttpSession session);
	public void resetPwdAuthCreate(MemberDto member) throws Exception;
	public boolean changePwd(MemberDto member);
}
