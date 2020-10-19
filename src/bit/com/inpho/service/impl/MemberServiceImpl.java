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

		session.setMaxInactiveInterval(24*3600);
		if(result!=null) {
			//로그인 성공시에 loginFail 세션은 전부다 초기화가 된다
			session.removeAttribute("loginFail");
			//담긴정보 = seq,email,auth,nickname,create,profile_image
			session.setAttribute("login", result);
			return true;
		}
		
		//로그인 실패시에 세션저장
		if(session.getAttribute("loginFail")==null) {
			session.setAttribute("loginFail", 1);
		}else {
			int failNum = ((int)session.getAttribute("loginFail"));
			session.setAttribute("loginFail", ++failNum);
		}

		System.out.println("로그인 실패");
		return false;
	}

	@Override
	public boolean regeisterMember(MemberDto member, HttpSession session) {
		//회원가입 성공시 로그인이 됨.
		if(memberDao.regeisterMember(member)>0) {
			doLogin(member, session);
			System.out.println(((MemberDto)session.getAttribute("login")).toString());
			return true;
		}
		//회원가입 실패시에
		return false;
	}

	@Override
	public boolean socialLogin(MemberDto member, HttpSession session) {
		MemberDto result =  memberDao.doSocialLogin(member);
		
		if(result==null) {
			//회원이 아닌경우
			int insertResult = memberDao.regeisterSocialMember(member);
			if(insertResult>0) {
				result = memberDao.doSocialLogin(member);
			}else {
				return false;
			}
		}
		session.setAttribute("login", result);
		session.setMaxInactiveInterval(24*3600);
		return true;
	}

	


	
}
