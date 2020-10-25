package bit.com.inpho.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import bit.com.inpho.dao.MemberDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.service.MemberService;
import bit.com.inpho.util.MailHandler;
import bit.com.inpho.util.MemberUtil;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override	//이메일 확인
	public boolean confirmId(MemberDto member) {
		return memberDao.confirmID(member);
	}
	
	@Override	//로그인을 실행하는 메소드
	public String doLogin(MemberDto member,HttpSession session) 
			throws Exception{
		MemberDto result = memberDao.doLogin(member);
		
		session.setMaxInactiveInterval(24*3600);
		if(result!=null) {
			//로그인 성공시에 loginFail 세션은 전부다 초기화가 된다
			if(result.getAuth_enabled()==1 && result.getAuth_active()==1) {
				//담긴정보 = seq,email,auth,nickname,create,profile_image
				session.setAttribute("login", result);
				session.removeAttribute("loginFail");
				return "success";
			}else if(result.getAuth_enabled()==0) {
				return "authErr";
			}else if(result.getAuth_active()==0) {
				return "noActive";
			}
		}
		
		//로그인 실패시에 세션저장 
		//이슈발견..다른계정으로 실패해도 noActive가 실행되긴함...!아 로그인시도한계정을 넣었어야했다...
		if(session.getAttribute("loginFail")==null) {
			session.setAttribute("loginFail", 1);
		}else {
			int failNum = ((int)session.getAttribute("loginFail"))+1;
			System.out.println(failNum);
			if(failNum>=5) {
				if(!memberDao.confirmID(member)) {
					if(failNum==5) {
						MemberUtil.changeNoActiveMember(member, memberDao, mailSender);
						session.setAttribute("loginFail", failNum);
					}
					return "noActive";
				}
			}
			session.setAttribute("loginFail", failNum);	
		}
		return "fail";
	}

	@Override
	public boolean regeisterMember(MemberDto member, HttpSession session) throws Exception {
		return MemberUtil.registerMember(member, session, memberDao, mailSender, this);
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

	
	@Override	//유저가 이메일로 온링크를 타고 인증을 하려고 하는 메소드 
	public boolean idActive(MemberDto member, HttpSession session) {
		MemberDto reqAuthMember = memberDao.selectAuthKey(member.getAuthKey());
		if(reqAuthMember!=null) {
			memberDao.deleteAuthKey(member.getAuthKey());
			memberDao.activeId(reqAuthMember);
			reqAuthMember = memberDao.authKeyLogin(reqAuthMember);
			session.setMaxInactiveInterval(24*3600);
			session.setAttribute("login", reqAuthMember);
			return true;
		}		
		return false;
	}

	@Override
	public void reActiveId(MemberDto member, HttpSession session) {
		MemberDto reqAuthMember = memberDao.selectAuthKey(member.getAuthKey());
		if(reqAuthMember != null) {
			memberDao.deleteAuthKey(member.getAuthKey()); //인증키Table Data 삭제
			if(memberDao.changeActive(reqAuthMember)) {
				//true == 계정 비활성화 해제 성공
				reqAuthMember = memberDao.authKeyLogin(reqAuthMember);
				session.setMaxInactiveInterval(24*3600);
				session.setAttribute("login", reqAuthMember);
			}else {
				System.out.println("계정활성화 실패");
			}
		}
	}

}
