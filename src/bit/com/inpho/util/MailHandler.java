package bit.com.inpho.util;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage msg;
	private MimeMessageHelper msgHelper;
	
	public MailHandler() {
		
		
	}
	public MailHandler(JavaMailSender mailSender)throws MessagingException{
		this.mailSender = mailSender;
		msg = this.mailSender.createMimeMessage();
		msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
	}
	
	//email title 설정
	public void setTitle(String title) throws Exception{
		msgHelper.setSubject(title);
	}
	
	//email 내용설정
	public void setContent(String content) throws Exception{
		msgHelper.setText(content, true);
	}
	
	//sender Info
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
		msgHelper.setFrom(email, name);
	}
	
	//받는사람
	public void setTo(String email) throws MessagingException{
		msgHelper.setTo(email);
	}
	public void send() {
		try {
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
