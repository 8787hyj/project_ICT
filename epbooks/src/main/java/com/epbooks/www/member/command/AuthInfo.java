package com.epbooks.www.member.command;

// 로그인시 사용할 커맨드객체
public class AuthInfo {
	
	String memberId;
	String password;
	String email;
	String name;
	
	public AuthInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public AuthInfo(String memberId, String password, String email, String name) {
		this.memberId = memberId;
		this.password = password;
		this.email = email;
		this.name = name;
	}
	
	public AuthInfo(String memberId, String email, String name) {
		this.memberId = memberId;
		this.email = email;
		this.name = name;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "AuthInfo [memberId=" + memberId + ", password=" + password + ", email=" + email + ", name=" + name
				+ "]";
	}
	
}
