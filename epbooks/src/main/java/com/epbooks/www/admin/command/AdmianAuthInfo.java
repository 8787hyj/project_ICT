package com.epbooks.www.admin.command;

public class AdmianAuthInfo {

	String adminId;
	String adminPassword;
	String email;
	String name;
	
	public AdmianAuthInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AdmianAuthInfo(String adminId, String adminPassword) {
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}


	public AdmianAuthInfo(String adminId, String adminPassword, String email, String name) {
		this.adminId = adminId;
		this.adminPassword = adminPassword;
		this.email = email;
		this.name = name;
	}

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
	
	
}
