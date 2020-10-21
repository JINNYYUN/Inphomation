package bit.com.inpho.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/main",method = {RequestMethod.GET,RequestMethod.POST})
	public String goMainPage(Model model, HttpSession session) {
		List<MainPostDto> list;
		if(session.getAttribute("login")==null) {
			list = mainService.getNewFeed();
		}else {
			int userSeq = ((MemberDto)session.getAttribute("login")).getUser_seq();
			System.out.println(userSeq);
			list = mainService.getNewFeed(userSeq);
		}
		
		model.addAttribute("postList",list);
		return "main.tiles";
	}
	
}
