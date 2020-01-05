package write.model;

public class Categ {
	private int c_num;
	private String c_category;
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	@Override
	public String toString() {
		return "Categ [c_num=" + c_num + ", c_category=" + c_category + "]";
	}
	public Categ(int c_num, String c_category) {
		super();
		this.c_num = c_num;
		this.c_category = c_category;
	}
	public Categ() {
		super();
	}
	
	
}
