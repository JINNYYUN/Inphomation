package bit.com.inpho.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.inpho.dao.MainDao;
import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/main",method = {RequestMethod.GET,RequestMethod.POST})
	public String goMainPage(Model model) {
		List<MainPostDto> list = mainService.getNewFeed();
		model.addAttribute("postList",list);
		return "main.tiles";
	}
	
}
