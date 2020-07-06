package com.epbooks.www.member.command;

public class LoginCommand {

	private String memberId;
	private String password;
	private boolean rememberMemberId;
	
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
	public boolean isRememberMemberId() {
		return rememberMemberId;
	}
	public void setRememberMemberId(boolean rememberMemberId) {
		this.rememberMemberId = rememberMemberId;
	}

}
