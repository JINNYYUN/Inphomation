package bit.com.inpho.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MemberDao;
import bit.com.inpho.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	SqlSessionTemplate sql;
	String ns = "Member.";
	
	
	@Override
	public boolean confirmID(MemberDto member) {
		//아이디 확인 true ==아이디가 없슴
		//false==아이디가 있슴
		return sql.selectOne(ns+"confirmId",member)==null?true:false;
	}

	@Override
	public MemberDto doLogin(MemberDto member) {
		return sql.selectOne(ns+"userLogin",member); //Login결과
	}

	@Override
	public int regeisterMember(MemberDto member) {
		return sql.insert(ns+"registerMemberHomePage",member);
	}

	@Override
	public MemberDto doSocialLogin(MemberDto member) {
		return sql.selectOne(ns+"userSocialLogin",member);
	}

	@Override
	public int regeisterSocialMember(MemberDto member) {
		return sql.insert(ns+"registerSocialMember",member);
	}

	@Override
	public int regeisterNoImageSocialMember(MemberDto member) {
		return sql.insert(ns+"registerNoImageMember",member);
	}

	@Override
	public int registerAuthKey(MemberDto member) {
		//인증키넣는 부분
		System.out.println("authKey : "+member.toString());
		return sql.insert(ns+"registerAuthKey",member);
	}

	@Override
	public MemberDto selectAuthKey(String authKey) {
		return sql.selectOne(ns+"searchAuthKey",authKey);
	}

	public int deleteAuthKey(String authKey) {
		return sql.delete(ns+"authKey", authKey);
	}
	public MemberDto doAuthLogin(MemberDto member) {
		return sql.selectOne(ns+"userAuthLogin", member);
	}

	@Override
	public MemberDto authKeyLogin(MemberDto reqAuthMember) {
		return sql.selectOne(ns+"userAuthLogin", reqAuthMember);
	}

	@Override
	public int activeId(MemberDto member) {
		return sql.update(ns+"activeId",member);
	}

}
