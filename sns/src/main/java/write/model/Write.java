package write.model;

public class Write {
	private int t_num;
	private int m_num;
	private String t_content;
	private String t_todate;
	private String t_visible;
	private int c_num;
	
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public String getT_todate() {
		return t_todate;
	}
	public void setT_todate(String t_todate) {
		this.t_todate = t_todate;
	}
	public String getT_visible() {
		return t_visible;
	}
	public void setT_visible(String t_visible) {
		this.t_visible = t_visible;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public Write(int t_num, int m_num, String t_content, String t_todate, String t_visible, int c_num) {
		super();
		this.t_num = t_num;
		this.m_num = m_num;
		this.t_content = t_content;
		this.t_todate = t_todate;
		this.t_visible = t_visible;
		this.c_num = c_num;
	}
	@Override
	public String toString() {
		return "Write [t_num=" + t_num + ", m_num=" + m_num + ", t_content=" + t_content + ", t_todate=" + t_todate
				+ ", t_visible=" + t_visible + ", c_num=" + c_num + "]";
	}
	public Write() {
		super();
	}
	
	
	

}
