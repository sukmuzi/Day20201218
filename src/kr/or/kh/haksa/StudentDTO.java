package kr.or.kh.haksa;

import java.io.Serializable;

public class StudentDTO extends HaksaDTO implements Serializable {
	private String hakbun;

	public StudentDTO() {
		super();
	}

	public StudentDTO(int no, String age, String name, String hakbun) {
		super(no, age, name);
		this.hakbun = hakbun;
	}

	public String getHakbun() {
		return hakbun;
	}

	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}

	@Override
	public String toString() {
		return super.toString() + "StudentDTO [hakbun=" + hakbun + "]";
	}

}
