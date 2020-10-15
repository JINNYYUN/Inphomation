package bit.com.inpho.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.MessageDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.MessageService;
import bit.com.inpho.service.MyPageService;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	@Autowired
	MyPageService mypageService;
	
	@RequestMapping(value = "goMessage", method = RequestMethod.GET)
	public String goChat(Model model, int user_target, HttpServletRequest req) {
		
		// 대화한 유저 list
		
		// 대화내용
		MyPageMemberDto login = (MyPageMemberDto)req.getSession().getAttribute("login");
		MessageDto msg = new MessageDto(login.getUser_seq(), user_target);
		
		List<MessageDto> list = service.getMsg(msg);
		
		// 타깃 유저 seq
		MyPageMemberDto target = mypageService.getProfile(user_target);
		
		model.addAttribute("msglist", list);
		model.addAttribute("target", target);
		
		return "goMessage.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "sendMsg", method = RequestMethod.POST)
	public void sendMsg(MessageDto msg) {
		int n = service.sendMsg(msg);
		System.out.println(n>0?"메시지 저장성공":"메시지 저장실패");
	}

		
	
}
