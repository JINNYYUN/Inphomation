package bit.com.inpho.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import bit.com.inpho.dto.NaverLoginApi;

//네이버백엔드 실행
public class NaverController {
	private final static String naverClientId="EZAyCLocCK4jspxmXDYC";
	private final static String naverClientSecret="iOhJCQMv1e";
	private final static String naverCallbackURL="http://localhost:8090/naverLogin";
	private final static String SESSION_STATE = "oauth_state";
	
	//네이버 URL인증 생성
	public String getAuthorizationUrl(HttpSession session) {
		//세션 검증 난수
		String state = generateRandomString(); 
		/* 생성한 난수 값을 session에 저장 */ 
		setSession(session, state);
		
		OAuth20Service oauthService  = new ServiceBuilder().apiKey(naverClientId)
					.apiSecret(naverClientSecret).callback(naverCallbackURL).state(state)
					.build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	//callback및 accessToken
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception{
		String sessionState = getSession(session);
		if(StringUtils.equals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder().apiKey(naverClientId).apiSecret(naverClientSecret)
						.callback(naverCallbackURL).state(state).build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			
			return accessToken;
		}
		return null;
	}
	
	//난수생성
	private String generateRandomString() {
		return (String) UUID.randomUUID().toString();
	}
	
	//httpSession에 난수 저장
	private void setSession(HttpSession session,String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	//http session GetData
	private String getSession(HttpSession session) {
		return (String)session.getAttribute(SESSION_STATE);
	}
	
	//일단보류
	/* 프로필 조회 API URL */ 
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */ 
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception { 
		OAuth20Service oauthService = new ServiceBuilder().apiKey(naverClientId).apiSecret(naverClientSecret) 
						.callback(naverCallbackURL).build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService); 
		oauthService.signRequest(oauthToken, request); 
		
		Response response = request.send(); 
		return response.getBody(); 
		} 
	public void naverProfile(String accessToken) {
		//String token = accessToken;
		String token="AAAAOEAdoHpRV13kGJiiuz6ysJHO3T4OFMSOykQoN6PXkihRCak9il6ZhkbuVwABI6XM6slOePfBOYDFjvnTj13k8ww";
		// 네이버 로그인 접근 토큰; 
		String header = "Bearer " + token; 
		// Bearer 다음에 공백 추가 
		try { 
			String apiURL = "https://openapi.naver.com/v1/nid/me"; 
			URL url = new URL(apiURL); 
			HttpURLConnection con = (HttpURLConnection)url.openConnection(); 
			con.setRequestMethod("GET"); 
			con.setRequestProperty("Authorization", header); 
			int responseCode = con.getResponseCode(); 
			BufferedReader br; 
			if(responseCode==200) { 
				// 정상 호출 
				br = new BufferedReader(new InputStreamReader(con.getInputStream())); 
			}else { 
				// 에러 발생 
				br = new BufferedReader(new InputStreamReader(con.getErrorStream())); 
			} 
		String inputLine; 
		StringBuffer response = new StringBuffer(); 
		while ((inputLine = br.readLine()) != null) { 
			response.append(inputLine); 
			} 
		br.close(); 
		System.out.println(response.toString()); 
		} catch (Exception e) { 
			System.out.println(e); 
		}
	}

	
}
