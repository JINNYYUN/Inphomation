package bit.com.inpho.util;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import bit.com.inpho.dao.MemberDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.searchDto;
import bit.com.inpho.service.MemberService;

public class MemberUtil {
	
	public static String makePassword(int length) {
		
		char[] charSet = 
				new char[] { 
						'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
						'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
						'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
						'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < length; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); 
		} 
		return sb.toString();
	}
	
	public static void settingNumber(searchDto search) {
		search.setStartNum(search.getMoreFeedNum());
		search.setEndNum(search.getMoreFeedNum());
	}
	
	public static boolean registerMember(MemberDto member, HttpSession session, MemberDao memberDao,
			JavaMailSender mailSender, MemberService service) throws Exception{
		//회원가입 성공
		String authKey = "";
		member.setAuthKey(getAuthKey(memberDao));
		
		if(memberDao.regeisterMember(member)>0) {
			if(memberDao.registerAuthKey(member)>0) {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setTitle("Inphomation 회원인증");
				sendMail.setContent(
						new StringBuffer()
						.append("<a href='http://222.117.114.82:8090/authKeyId?authKey=") //추후에 서버로 잡을 주소 변경
						.append(member.getAuthKey()+"' target='_blank'>이메일 인증</a>")
						.toString()
					);
				sendMail.setFrom("inphomationBitFinal@gmail.com", "인포메이션");
				sendMail.setTo(member.getUser_email());
				sendMail.send();
				
				service.doLogin(member, session);
				return true;
			}
		}
		//회원가입 실패
		return false;
	}
	public static void changeNoActiveMember(MemberDto member, MemberDao memberDao, 
			JavaMailSender mailSender) throws Exception{
		//계정잠금
		System.out.println("계정잠금");
		member.setAuthKey(getAuthKey(memberDao));
		//인증키 생성
		
		//가서하는것 == AUTH_ACTIVE(MEMBER) 를 1로 바꾸고 MEMBER_AUTH에 데이터 INSERT
		memberDao.changeNoActive(member); 
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setTitle("계정 비활성화 재인증 안내 메일");
		sendMail.setContent(
				new StringBuffer()
				.append("<h2>과한 비밀번호 입력으로 인하여 로그인이 불가능합니다</h2>")
				.append("<a href='http://222.117.114.82:8090/reActive?authKey=") //추후에 서버로 잡을 주소 변경
				.append(member.getAuthKey()+"' target='_blank'>재인증 해주시기 바랍니다</a>")
				.toString()
			);
		sendMail.setFrom("inphomationBitFinal@gmail.com", "인포메이션");
		sendMail.setTo(member.getUser_email());
		sendMail.send();
	}
	
	public static void resetPassword(MemberDto member, MemberDao memberDao, 
			JavaMailSender mailSender) throws Exception{
		System.out.println("비밀번호 재생성 메일발송 메소드");
		//인증키 생성
		member.setAuthKey(getAuthKey(memberDao));
		memberDao.registerAuthKey(member);
		//메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setTitle("비밀번호 변경 URL 안내 메일");
		sendMail.setContent(
				new StringBuffer()
				.append("<h2>비밀번호 변경 URL입니다</h2>")
				.append("<a href='http://222.117.114.82:8090/resetPassword?authKey=") //추후에 서버로 잡을 주소 변경
				.append(member.getAuthKey()+"' target='_blank'>링크</a>")
				.toString()
			);
		sendMail.setFrom("inphomationBitFinal@gmail.com", "인포메이션");
		sendMail.setTo(member.getUser_email());
		sendMail.send();
	}
	
	public static String getAuthKey(MemberDao memberDao) {
		for(;;) {
			String authKey = makePassword(50);
			if(memberDao.selectAuthKey(authKey)==null) {
				return authKey;
			}
		}
	}
	
}
