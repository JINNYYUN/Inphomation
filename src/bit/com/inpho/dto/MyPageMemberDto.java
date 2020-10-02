package bit.com.inpho.dto;

import java.io.Serializable;

public class MyPageMemberDto implements Serializable {

	private int user_seq;
	private String user_email;
	private int auth;
	private String user_password;
	private String user_nickname;
	private String user_create;
	private String profile_image;
	private String mypage_introduce;
	

	public MyPageMemberDto() {

	}


	public MyPageMemberDto(int user_seq, String user_email, int auth, String user_password, String user_nickname,
			String user_create, String profile_image, String mypage_introduce) {
		super();
		this.user_seq = user_seq;
		this.user_email = user_email;
		this.auth = auth;
		this.user_password = user_password;
		this.user_nickname = user_nickname;
		this.user_create = user_create;
		this.profile_image = profile_image;
		this.mypage_introduce = mypage_introduce;
	}


	public int getUser_seq() {
		return user_seq;
	}


	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public int getAuth() {
		return auth;
	}


	public void setAuth(int auth) {
		this.auth = auth;
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


	@Override
	public String toString() {
		return "MyPageMemberDto [user_seq=" + user_seq + ", user_email=" + user_email + ", auth=" + auth
				+ ", user_password=" + user_password + ", user_nickname=" + user_nickname + ", user_create="
				+ user_create + ", profile_image=" + profile_image + ", mypage_introduce=" + mypage_introduce + "]";
	}

	
}
