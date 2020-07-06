package com.epbooks.www.order.dto;

import java.sql.Date;

public class OrderList {
	private int orderListNo;
	private int orderAmount;
	private Date orderDate;
	private int orderNo;
	private String ISBN;
	
	public OrderList() {
	}
	
	public OrderList(int orderListNo, int orderAmount, Date orderDate, int orderNo, String iSBN) {
		super();
		this.orderListNo = orderListNo;
		this.orderAmount = orderAmount;
		this.orderDate = orderDate;
		this.orderNo = orderNo;
		ISBN = iSBN;
	}
	
	public int getOrderListNo() {
		return orderListNo;
	}
	
	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
}