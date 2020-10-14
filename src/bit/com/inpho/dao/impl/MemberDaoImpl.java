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

}
