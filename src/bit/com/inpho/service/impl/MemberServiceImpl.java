package bit.com.inpho.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MemberDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public boolean confirmId(MemberDto member) {
		return memberDao.confirmID(member);
	}

	@Override
	public boolean doLogin(MemberDto member,HttpSession session) {
		MemberDto result = memberDao.doLogin(member);
		if(result!=null) {
			//담긴정보 = seq,email,auth,nickname,create,profile_image
			session.setAttribute("login", result);
			return true;
		}
		return false;
	}
	
}
