package bit.com.inpho.controller;



import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@RequestMapping(value = "postUpdate.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String postwrite(Model model,HttpSession session) {
		logger.info("post"+new Date());
//		String id = ((MemberDto)session.getAttribute("login")).getUser_email();
		return "mainpage.tiles";
		
	}
}
