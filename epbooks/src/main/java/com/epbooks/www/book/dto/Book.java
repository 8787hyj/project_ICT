package com.epbooks.www.book.dto;

public class Book {
	
	private String isbn;
	private String title;
	private int pricesales;
	private String desciption;
	private int bookAmount;
	private String author;
	private String category;
	private String publisher;
	private String bookimage;
	
	public Book(String isbn, String title, int pricesales, String desciption, int bookAmount, String author,
			String category, String publisher,String bookimage) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.pricesales = pricesales;
		this.desciption = desciption;
		this.bookAmount = bookAmount;
		this.author = author;
		this.category = category;
		this.publisher = publisher;
		this.bookimage = bookimage;
	}
	
	public int getBookAmount() {
		return bookAmount;
	}
	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}
	public String getISBN() {
		return isbn;
	}
	public String getTitle() {
		return title;
	}
	public int getPricesales() {
		return pricesales;
	}
	public String getDesciption() {
		return desciption;
	}
	public String getAuthor() {
		return author;
	}
	public String getCategory() {
		return category;
	}
	public String getPublisher() {
		return publisher;
	}
	
	public String getBookimage() {
		return bookimage;
	}

	public boolean matchISBN(String isbn2) {
		return this.isbn.equals(isbn2);
	}
	
	
	
	
}
