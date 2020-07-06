package com.epbooks.www.cart.dto;

public class Cart {
	
	private int cartId;
	private int cartAmount;
	private String isbn;
	private String memberid;

	// 생성자
	
	
	public Cart() {}

	
	public Cart(int cartId, int cartAmount, String isbn, String memberid) {
		this.cartId = cartId;
		this.cartAmount = cartAmount;
		this.isbn = isbn;
		this.memberid = memberid;
	}


	// Getter & Setter
	
	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	
	public int getCartAmount() {
		return cartAmount;
	}


	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}


	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public String getMemberId() {
		return memberid;
	}


	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}


	
	
	
	
}
