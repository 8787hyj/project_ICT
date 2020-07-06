package com.epbooks.www.admin.dto;

import java.util.Date;

public class Admin {

	private String adminId;    //아이디
    private String adminPassword;    //비밀번호
    private Date adminRegdate;    //등록일자
    private Date adminModifydate;    //수정일자
    
    
	public Admin(String adminId, String adminPassword) {
		this.adminId = adminId;
		this.adminPassword = adminPassword;
	}

	public Admin(String adminId, String adminPassword, Date adminRegdate, Date adminModifydate) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
		this.adminRegdate = adminRegdate;
		this.adminModifydate = adminModifydate;
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
	public Date getAdminRegdate() {
		return adminRegdate;
	}
	public void setAdminRegdate(Date adminRegdate) {
		this.adminRegdate = adminRegdate;
	}
	public Date getAdminModifydate() {
		return adminModifydate;
	}
	public void setAdminModifydate(Date adminModifydate) {
		this.adminModifydate = adminModifydate;
	}
	
	public boolean matchPassword(String adminPassword) { 
		// 로그인시 비밀번호 체크를 하기 위한 메소드
		return this.adminPassword.equals(adminPassword);
	}
	
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPassword=" + adminPassword + "]";
	}
    
}
