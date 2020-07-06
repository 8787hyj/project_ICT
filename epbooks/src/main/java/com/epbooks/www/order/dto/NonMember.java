package com.epbooks.www.order.dto;

public class NonMember {
	
	private int nonMemberId;
	private String nonMemberName;
	private String nonMemberEmail;
	private String nonMemberPhone;
	private	String nonMemberAddress;
	
	public NonMember() {
	
	}
	
	public NonMember(int nonMemberId, String nonMemberName, String nonMemberEmail, String nonMemberPhone,
			String nonMemberAddress) {
		super();
		this.nonMemberId = nonMemberId;
		this.nonMemberName = nonMemberName;
		this.nonMemberEmail = nonMemberEmail;
		this.nonMemberPhone = nonMemberPhone;
		this.nonMemberAddress = nonMemberAddress;
	}

	public int getNonMemberId() {
		return nonMemberId;
	}
	
	public void setNonMemberId(int nonMemberId) {
		this.nonMemberId = nonMemberId;
	}
	
	public String getNonMemberName() {
		return nonMemberName;
	}
	
	public void setNonMemberName(String nonMemberName) {
		this.nonMemberName = nonMemberName;
	}
	
	public String getNonMemberEmail() {
		return nonMemberEmail;
	}
	
	public void setNonMemberEmail(String nonMemberEmail) {
		this.nonMemberEmail = nonMemberEmail;
	}
	
	public String getNonMemberPhone() {
		return nonMemberPhone;
	}
	
	public void setNonMemberPhone(String nonMemberPhone) {
		this.nonMemberPhone = nonMemberPhone;
	}
	
	public String getNonMemberAddress() {
		return nonMemberAddress;
	}
	
	public void setNonMemberAddress(String nonMemberAddress) {
		this.nonMemberAddress = nonMemberAddress;
	}
}