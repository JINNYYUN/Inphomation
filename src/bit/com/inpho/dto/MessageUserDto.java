package bit.com.inpho.dto;

import java.io.Serializable;

public class MessageUserDto implements Serializable {

	private int msg_seq;
	private int user_sender;
	private int user_target;
	private String msg_content;
	private String msg_send;
	private String msg_open;
	
	private String user_nickname;
	private String profile_image;
	private int isSend;	// 0 보낸메시지 1 받은메시지
	
	public MessageUserDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MessageUserDto(int msg_seq, int user_sender, int user_target, String msg_content, String msg_send,
			String msg_open, String user_nickname, String profile_image, int isSend) {
		super();
		this.msg_seq = msg_seq;
		this.user_sender = user_sender;
		this.user_target = user_target;
		this.msg_content = msg_content;
		this.msg_send = msg_send;
		this.msg_open = msg_open;
		this.user_nickname = user_nickname;
		this.profile_image = profile_image;
		this.isSend = isSend;
	}

	public int getMsg_seq() {
		return msg_seq;
	}

	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}

	public int getUser_sender() {
		return user_sender;
	}

	public void setUser_sender(int user_sender) {
		this.user_sender = user_sender;
	}

	public int getUser_target() {
		return user_target;
	}

	public void setUser_target(int user_target) {
		this.user_target = user_target;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_send() {
		return msg_send;
	}

	public void setMsg_send(String msg_send) {
		this.msg_send = msg_send;
	}

	public String getMsg_open() {
		return msg_open;
	}

	public void setMsg_open(String msg_open) {
		this.msg_open = msg_open;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	

	public int getIsSend() {
		return isSend;
	}

	public void setIsSend(int isSend) {
		this.isSend = isSend;
	}

	@Override
	public String toString() {
		return "MessageUserDto [msg_seq=" + msg_seq + ", user_sender=" + user_sender + ", user_target=" + user_target
				+ ", msg_content=" + msg_content + ", msg_send=" + msg_send + ", msg_open=" + msg_open
				+ ", user_nickname=" + user_nickname + ", profile_image=" + profile_image + ", isSend=" + isSend + "]";
	}

	
	
}
