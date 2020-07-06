package com.epbooks.www.admin.command;

public class AdminCommand {

	private String adminId;    //아이디
    private String adminPassword;    //비밀번호
    private boolean rememberAdminId;
    
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public boolean isRememberAdminId() {
		return rememberAdminId;
	}
	public void setRememberAdminId(boolean rememberAdminId) {
		this.rememberAdminId = rememberAdminId;
	}
    
}
