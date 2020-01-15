package message.model;

public class Message {
	private int s_num;
	private String s_fromnum;
	private String s_msg;
	private String s_date;
	private String s_tonum;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_fromnum() {
		return s_fromnum;
	}
	public void setS_fromnum(String s_fromnum) {
		this.s_fromnum = s_fromnum;
	}
	public String getS_msg() {
		return s_msg;
	}
	public void setS_msg(String s_msg) {
		this.s_msg = s_msg;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_tonum() {
		return s_tonum;
	}
	public void setS_tonum(String s_tonum) {
		this.s_tonum = s_tonum;
	}
	public Message(int s_num, String s_fromnum, String s_msg, String s_date, String s_tonum) {
		super();
		this.s_num = s_num;
		this.s_fromnum = s_fromnum;
		this.s_msg = s_msg;
		this.s_date = s_date;
		this.s_tonum = s_tonum;
	}
	public Message() {
		super();
	}
	@Override
	public String toString() {
		return "Message [s_num=" + s_num + ", s_fromnum=" + s_fromnum + ", s_msg=" + s_msg + ", s_date=" + s_date
				+ ", s_tonum=" + s_tonum + "]";
	}


	
	
	
	
	
	

}
