package bit.com.inpho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@RequestMapping(value = "goChat", method = RequestMethod.GET)
	public String goChat() {
		return "goChat.tiles";
	}

		
	
}
