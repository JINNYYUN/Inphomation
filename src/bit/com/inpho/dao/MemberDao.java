package bit.com.inpho.dao;

import bit.com.inpho.dto.MemberDto;

public interface MemberDao {
	//아이디 확인
	public boolean confirmID(MemberDto member);
	//로그인
	public MemberDto doLogin(MemberDto member);
	//회원가입
	public int regeisterMember(MemberDto member);
	//소셜 로그인
	public MemberDto doSocialLogin(MemberDto member);
	//소셜 회원가입
	public int regeisterSocialMember(MemberDto member);
	public int regeisterNoImageSocialMember(MemberDto member);
	public int registerAuthKey(MemberDto member);
	public MemberDto selectAuthKey(String authKey);
	public int deleteAuthKey(String authKey);
	public MemberDto doAuthLogin(MemberDto member);
	public MemberDto authKeyLogin(MemberDto reqAuthMember);
	public int activeId(MemberDto member);
	public void changeNoActive(MemberDto member);
	public boolean changeActive(MemberDto member);
}
