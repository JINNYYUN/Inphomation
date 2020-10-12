package bit.com.inpho.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class memberController {
	
	
	private NaverController naver;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginController(NaverController naver) {
		this.naver = naver;
	}
	
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
	@ResponseBody
	@RequestMapping(value="/getNaverLink",method= {RequestMethod.GET})
	public String getNaverLoginLink(Model model, HttpSession session) {
		//네이버 인증페이지로 이동을 위한 링크생성
		String naverAuthUrl = naver.getAuthorizationUrl(session);
		System.out.println("CreateGoNaverUrl : " + naverAuthUrl);
		
		return naverAuthUrl;
	}
	
	@RequestMapping(value="/naverLogin",method= {RequestMethod.GET})
	public String naverCallBack(Model model, HttpSession session, @RequestParam String code, @RequestParam String state) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = naver.getAccessToken(session, code, state);
		
		//사용자정보 json으로 받아옴
		apiResult = naver.getUserProfile(oauthToken);
		
		//String형식을 json으로 변환 
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)obj;
		
		//json안의 response파싱
		JSONObject responseObj = (JSONObject)jsonObj.get("response");
		String nickname = (String)responseObj.get("nickname");
		
		System.out.println("nickname");
		
		model.addAttribute("result",apiResult);
		
		return "naverLogin.tiles";
	}
	
	@RequestMapping(value="/logout",method= {RequestMethod.GET})
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:/main";
	}
}
