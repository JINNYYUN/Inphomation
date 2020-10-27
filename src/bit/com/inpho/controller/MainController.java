package bit.com.inpho.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.searchDto;
import bit.com.inpho.service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	List<MainPostDto> list;
	@RequestMapping(value={"/","/main"},method = {RequestMethod.GET,RequestMethod.POST})
	public String goMainPage(Model model, HttpSession session) {
		list = null;
		if(session.getAttribute("login")==null) {
			list = mainService.getNewFeed();
		}else {
			int userSeq = ((MemberDto)session.getAttribute("login")).getUser_seq();
			list = mainService.getNewFeed(userSeq);
		}
		
		model.addAttribute("postList",list);
		return "main.tiles";
	}
	
	@RequestMapping(value="/keywordSearch",method = {RequestMethod.GET})
	public String searchList(searchDto search, Model model, HttpSession session) {
		list = null;
		MemberDto member = (MemberDto)session.getAttribute("login");
		if(member != null) {//로그인중
			search.setUserSeq(member.getUser_seq());
			list = mainService.getSearchFeed(search);
		}else {
			list = mainService.getSearchFeed(search.getKeywordId());
		}
		model.addAttribute("postList",list);
		return "search.tiles";
	}
	
	@ResponseBody
	@GetMapping(value="/newMoreFeed")
	public List<MainPostDto> newMoreFeed(searchDto search,HttpSession session){
		list = null;
		list = mainService.getNewMoreFeed(session,search);
		
		return list;
	}
	@ResponseBody
	@GetMapping(value="/searchMoreFeed")
	public List<MainPostDto> searchMoreFeed(searchDto search,HttpSession session){
		list = null;
		list = mainService.getSearchMoreFeed(session,search);

		return list;
	}
	@GetMapping(value="hotFeed")
	public String hotFeed(HttpSession session, Model model){
		model.addAttribute("hotFeed", mainService.getHotFeed(session));
		return "hotFeed.tiles";
	}
}
