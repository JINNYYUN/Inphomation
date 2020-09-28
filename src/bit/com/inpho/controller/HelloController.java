package bit.com.inpho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.inpho.service.HelloService;

@Controller
public class HelloController {
	
	@Autowired
	HelloService service;
	
	
	@RequestMapping(value = "hello", method = RequestMethod.GET)
	public String hellotest(String id, Model model) {
		
		String name = service.getName(id);
		model.addAttribute("name", name);
		
		return "hello.tiles";
	}
	
}
