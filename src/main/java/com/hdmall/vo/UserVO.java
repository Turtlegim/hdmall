package com.hdmall.vo;

/* 경민영 : UserVO */
public class UserVO {
	String id;
	String pwd;
	String name;
	String hpNo;
	String email1;
	String email2;
	String userType;
	
	public UserVO() {
		System.out.println("LoginVO 생성자 호출");
	}
	
	public UserVO(String id, String pwd) { // 로그인
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public UserVO(String id, String pwd, String name, String hpNo, String email1, String email2, String userType) { // 회원가입 
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.hpNo = hpNo;
		this.email1 = email1;
		this.email2 = email2;
		this.userType = userType;
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

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getHpNo() {
		return hpNo;
	}

	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	
	public String getEmail1() {
		return email1;
	}
	
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	
	public String getEmail2() {
		return email2;
	}
	
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public String getUserType() {
		return userType;
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}
}