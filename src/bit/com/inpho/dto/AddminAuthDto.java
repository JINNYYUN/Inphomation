package bit.com.inpho.dto;

public class AddminAuthDto {
	private String addminOauthToken;
		
	public AddminAuthDto() {
		
	}
	public AddminAuthDto(String addminOauthToken) {
		super();
		this.addminOauthToken = addminOauthToken;
	}
	public String getAddminOauthToken() {
		return addminOauthToken;
	}

	public void setAddminOauthToken(String addminOauthToken) {
		this.addminOauthToken = addminOauthToken;
	}
	@Override
	public String toString() {
		return "AddminAuthDto [addminOauthToken=" + addminOauthToken + "]";
	}

	
}
