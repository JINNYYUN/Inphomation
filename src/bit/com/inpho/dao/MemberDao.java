package bit.com.inpho.dao;

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageMemberDto;

public interface MemberDao {
	//아이디 확인
	public boolean confirmID(MemberDto member);
	//로그인
	public MemberDto doLogin(MemberDto member);
}
