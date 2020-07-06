package com.epbooks.www.order.dto;

import java.sql.Date;
import java.util.Map;

public class MemberOrder {

	
	private int orderNo;
	private String memberId;
	private int orderAmount;
	private String name;
	private String address;
	private String email;
	private String phone;
	private int point;
	private int orderListNo;
	private Date orderDate;
	private String isbn;
	private String title;
	private String bookImagePath;
	private int pricesales;
	
	public MemberOrder() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberOrder(int orderNo, String memberId, int orderAmount, String name, String address, String email,
			String phone, int point, int orderListNo, Date orderDate, String isbn,String title,String bookImagePath,int pricesales) {
		super();
		this.orderNo = orderNo;
		this.memberId = memberId;
		this.orderAmount = orderAmount;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.orderListNo = orderListNo;
		this.orderDate = orderDate;
		this.isbn = isbn;
		this.isbn=isbn;
		this.bookImagePath = bookImagePath;
		this.pricesales=pricesales;
	}

	public MemberOrder(String isbn, int orderAmount) {
		this.isbn = isbn;
		this.orderAmount = orderAmount;
	}
	
	public MemberOrder(int orderListNo, int orderAmount, Date orderDate, int orderNo, String title) {
		this.orderListNo = orderListNo;
		this.orderAmount = orderAmount;
		this.orderDate = orderDate;
		this.orderNo = orderNo;
		this.title = title;
		
	}

	public MemberOrder(int memberOrderNo) {
		this.orderNo = memberOrderNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getOrderListNo() {
		return orderListNo;
	}

	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBookImagePath() {
		return bookImagePath;
	}

	public void setBookImagePath(String bookImagePath) {
		this.bookImagePath = bookImagePath;
	}

	public int getPricesales() {
		return pricesales;
	}

	public void setPricesales(int pricesales) {
		this.pricesales = pricesales;
	}
	
//	public void validate(Map<String, Boolean> errors) {
//		checkEmpty(errors, orderAmount, "amount");
//		checkEmpty(errors, name, "name");
//		checkEmpty(errors, adress, "adress");
//		checkEmpty(errors, email, "email");
//		checkEmpty(errors, phone, "phone");
//	}
//	//폼 요소에 값이 들어있는지 체크하고 없으면 errors Map에 등록
//	private void checkEmpty(Map<String, Boolean> errors, 
//			Object value, String fieldName) {
//		if (value == null || ((String) value).isEmpty())
//			errors.put(fieldName, Boolean.TRUE);
//	}

	
	
	
	
	
}
