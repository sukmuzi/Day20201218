package kr.or.kh.haksa;

public class HaksaDTO {
	private int no;
	private String age;
	private String name;

	public HaksaDTO() {
		super();
	}

	public HaksaDTO(int no, String age, String name) {
		super();
		this.no = no;
		this.age = age;
		this.name = name;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "HaksaDTO [no=" + no + ", age=" + age + ", name=" + name + "]";
	}

}
