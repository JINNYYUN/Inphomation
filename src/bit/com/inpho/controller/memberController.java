package bit.com.inpho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberController {
	@RequestMapping(value="/loginModal",method= {RequestMethod.GET})
	public String getModal(){
		return "modal.tiles";
	}
	@RequestMapping(value="/loginForm",method= {RequestMethod.GET})
	public String getLoginForm(){
		return "getLogin.tiles";
	}
	@RequestMapping(value="/regiForm",method= {RequestMethod.GET})
	public String getRegiForm(){
		return "getRegi.tiles";
	}
	
}
