package user.model;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private int m_num;
	private String m_email;
	
	private String m_name;
	private String m_firstname;
	private String m_lastname;
	private String m_password;
	private String m_signdate;  // 가입 일자 
	private String m_block;  // 해당 유저가 차단한 컨텐츠
	private String m_black;   //블랙리스트가 되면 1 
	private String m_out;   //탈퇴 하였으면 1 
	private String m_image; 
	private String m_backgroundimage; 
	
	private MultipartFile imglist; 
	
	
	
	
	@Override
	public String toString() {
		return "User [m_num=" + m_num + ", m_email=" + m_email + ", m_firstname=" + m_firstname + ", m_lastname="
				+ m_lastname + ", m_password=" + m_password + ", m_signdate=" + m_signdate + ", m_block=" + m_block
				+ ", m_black=" + m_black + ", m_out=" + m_out + "]";
	}
	public User(int m_num, String m_email,String m_name, String m_password, String m_signdate,
			String m_block, String m_black, String m_out, String m_image) {
		super();
		this.m_num = m_num;
		this.m_email = m_email;
		this.m_name = m_name;
		this.m_password = m_password;
		this.m_signdate = m_signdate;
		this.m_block = m_block;
		this.m_black = m_black;
		this.m_out = m_out;
		this.m_image = m_image;
	}
	public User() {
		super();
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_firstname() {
		return m_firstname;
	}
	public void setM_firstname(String m_firstname) {
		this.m_firstname = m_firstname;
	}
	public String getM_lastname() {
		return m_lastname;
	}
	public void setM_lastname(String m_lastname) {
		this.m_lastname = m_lastname;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_signdate() {
		return m_signdate;
	}
	public void setM_signdate(String m_signdate) {
		this.m_signdate = m_signdate;
	}
	public String getM_block() {
		return m_block;
	}
	public void setM_block(String m_block) {
		this.m_block = m_block;
	}
	public String getM_black() {
		return m_black;
	}
	public void setM_black(String m_black) {
		this.m_black = m_black;
	}
	public String getM_out() {
		return m_out;
	}
	public void setM_out(String m_out) {
		this.m_out = m_out;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public MultipartFile getImglist() {
		return imglist;
	}
	public void setImglist(MultipartFile imglist) {
		this.imglist = imglist;
		System.out.println("imglist:" + imglist);
		
		if(imglist != null) {
			this.m_image = imglist.getOriginalFilename();
			System.out.println(imglist.getOriginalFilename());
		}
	}
	public String getM_backgroundimage() {
		return m_backgroundimage;
	}
	public void setM_backgroundimage(String m_backgroundimage) {
		this.m_backgroundimage = m_backgroundimage;
	}
	
	
	
	
	
	
	

}
