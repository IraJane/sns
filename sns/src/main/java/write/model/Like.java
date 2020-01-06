package write.model;

public class Like {
	private int th_num;
	private String t_num;
	private String m_num;
	public int getTh_num() {
		return th_num;
	}
	public void setTh_num(int th_num) {
		this.th_num = th_num;
	}
	public String getT_num() {
		return t_num;
	}
	public void setT_num(String t_num) {
		this.t_num = t_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public Like(int th_num, String t_num, String m_num) {
		super();
		this.th_num = th_num;
		this.t_num = t_num;
		this.m_num = m_num;
	}
	public Like() {
		super();
	}
	@Override
	public String toString() {
		return "Like [th_num=" + th_num + ", t_num=" + t_num + ", m_num=" + m_num + "]";
	}
	
	
}
