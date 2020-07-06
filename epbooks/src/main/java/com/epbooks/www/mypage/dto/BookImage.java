package com.epbooks.www.mypage.dto;

public class BookImage {

	private String bookImagePath;
	private String isbn;
	
	public BookImage(String bookImagePath, String isbn) {
		this.bookImagePath = bookImagePath;
		this.isbn = isbn;
	}

	public String getBookImagePath() {
		return bookImagePath;
	}

	public void setBookImagePath(String bookImagePath) {
		this.bookImagePath = bookImagePath;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
	
	
}
