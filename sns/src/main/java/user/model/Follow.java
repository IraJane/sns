package user.model;

public class Follow {
	private int f_num;
	private String m_num;
	private String f_theirNum;
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getF_theirNum() {
		return f_theirNum;
	}
	public void setF_theirNum(String f_theirNum) {
		this.f_theirNum = f_theirNum;
	}
	public Follow(int f_num, String m_num, String f_theirNum) {
		super();
		this.f_num = f_num;
		this.m_num = m_num;
		this.f_theirNum = f_theirNum;
	}
	public Follow() {
		super();
	}
	@Override
	public String toString() {
		return "Follow [f_num=" + f_num + ", m_num=" + m_num + ", f_theirnum=" + f_theirNum + "]";
	}
	
	
	
}
