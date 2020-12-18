package kr.or.kh.haksa;

import java.io.Serializable;

public class ManagerDTO extends HaksaDTO implements Serializable {
	private String part;

	public ManagerDTO() {
		super();
	}

	public ManagerDTO(int no, String age, String name, String part) {
		super(no, age, name);
		this.part = part;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	@Override
	public String toString() {
		return super.toString() + "ManagerDTO [part=" + part + "]";
	}

}
