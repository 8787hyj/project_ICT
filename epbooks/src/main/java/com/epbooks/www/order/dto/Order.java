package com.epbooks.www.order.dto;

public class Order {
	
	private String orderNo;
	private String memberID;
	private int nonMemberID;
	
	public Order() {
	}

	public Order(String orderNo, String memberID, int nonMemberID) {
		super();
		this.orderNo = orderNo;
		this.memberID = memberID;
		this.nonMemberID = nonMemberID;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public int getNonMemberID() {
		return nonMemberID;
	}

	public void setNonMemberID(int nonMemberID) {
		this.nonMemberID = nonMemberID;
	}

}