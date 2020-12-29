package kr.or.kh.member;

import java.io.Serializable;

public class MemberDTO implements Serializable {
	private String id;
	private String pwd;
	private String addr;
	private String tel;

	public MemberDTO(String id, String pwd, String addr, String tel) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.addr = addr;
		this.tel = tel;
	}

	public MemberDTO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pw) {
		this.pwd = pw;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", addr=" + addr + ", tel=" + tel + "]";
	}

}