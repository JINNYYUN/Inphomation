package bit.com.inpho.dto;

import java.io.Serializable;

public class MessageDto implements Serializable {

	private int msg_seq;
	private int user_sender;
	private int user_target;
	private String msg_content;
	private String msg_send;
	private String msg_open;
	
	public MessageDto() {
	}
	
	public MessageDto(int msg_seq, int user_sender, int user_target, String msg_content, String msg_send,
			String msg_open) {
		super();
		this.msg_seq = msg_seq;
		this.user_sender = user_sender;
		this.user_target = user_target;
		this.msg_content = msg_content;
		this.msg_send = msg_send;
		this.msg_open = msg_open;
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

	@Override
	public String toString() {
		return "MessageDto [msg_seq=" + msg_seq + ", user_sender=" + user_sender + ", user_target=" + user_target
				+ ", msg_content=" + msg_content + ", msg_send=" + msg_send + ", msg_open=" + msg_open + "]";
	}
	
	
}
