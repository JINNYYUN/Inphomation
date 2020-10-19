package bit.com.inpho.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MessageDto;
import bit.com.inpho.dto.MessageUserDto;
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
	public String goMessage(Model model, HttpServletRequest req) {
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		// 대화한 유저 list
		//List<MessageUserDto> userlist =  service.getUserList(login.getUser_seq());		
		
		//model.addAttribute("userlist", userlist);
		
		return "goMessage.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getUsers", method = RequestMethod.POST)
	public List<MessageUserDto> getUsers(HttpServletRequest req) {
		
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		// 대화한 유저 list
		List<MessageUserDto> userlist =  service.getUserList(login.getUser_seq());		
		
		return userlist;
	}
	
	@ResponseBody
	@RequestMapping(value = "getMsg", method = RequestMethod.POST)
	public Map<String, Object> getMsg(MessageDto msg) {
		
		Map<String, Object> map = new HashMap();
		
		// 타깃 프로필
		MyPageMemberDto target = mypageService.getProfile(msg.getUser_target());
		
		// 대화내용
		List<MessageDto> msglist = service.getMsg(msg);
		
		map.put("target", target);
		map.put("msglist", msglist);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "sendMsg", method = RequestMethod.POST)
	public void sendMsg(MessageDto msg) {
		int n = service.sendMsg(msg);
		System.out.println(n>0?"메시지 저장성공":"메시지 저장실패");
	}
	
	@ResponseBody
	@RequestMapping(value = "setOpen", method = RequestMethod.POST)
	public void setOpen(MessageDto msg) {
		int n = service.setOpen(msg);
		System.out.println(n>0?"메시지 읽음 처리":"메시지 읽음 처리 실패");
	}

		
	
}
