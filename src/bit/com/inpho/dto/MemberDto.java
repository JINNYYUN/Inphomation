package bit.com.inpho.dto;

import java.io.Serializable;

public class MemberDto implements Serializable{
	private int user_seq;			//user seq
	private int auth;				//권한
	private String user_email;		//id
	private String user_password;	//pwd
	private String user_nickname;	//nickname
	private String user_create;		//계정생성일
	private String profile_image;	//프로필이미지 링크
	private String mypage_introduce;	//마이페이지소개
	private String provider;		//회원가입 루트
	private int auth_enabled;	//인증 미인증계정
	private int auth_active;		//활성화 비활성화
	private String authKey;			//회원가입 인증키
	
	public MemberDto() {}
	
	public int getAuth_enabled() {
		return auth_enabled;
	}
	public void setAuth_enabled(int auth_enabled) {
		this.auth_enabled = auth_enabled;
	}
	public int getAuth_active() {
		return auth_active;
	}

	public void setAuth_active(int auth_active) {
		this.auth_active = auth_active;
	}

	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getMypage_introduce() {
		return mypage_introduce;
	}
	public void setMypage_introduce(String mypage_introduce) {
		this.mypage_introduce = mypage_introduce;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

	@Override
	public String toString() {
		return "MemberDto [user_seq=" + user_seq + ", auth=" + auth + ", user_email=" + user_email + ", user_password="
				+ user_password + ", user_nickname=" + user_nickname + ", user_create=" + user_create
				+ ", profile_image=" + profile_image + ", mypage_introduce=" + mypage_introduce + ", provider="
				+ provider + ", auth_enabled=" + auth_enabled + ", auth_active=" + auth_active + ", authKey=" + authKey
				+ "]";
	}
}
