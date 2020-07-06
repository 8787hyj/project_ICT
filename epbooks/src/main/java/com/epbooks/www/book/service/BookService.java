package com.epbooks.www.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.book.dto.Book;
import com.epbooks.www.book.dto.BookList;
import com.epbooks.www.book.dto.BookListCategory;
import com.epbooks.www.book.dto.BookListSearch;

public interface BookService {

	public Book selectBookById(String isbn);
	public List<Book> selectBookAll();
	public int selectCount();
	public List<Book> selectBookCount(@Param("startrow") int startPage, int size);
	BookList getBookPage(int pageNum);
	public BookListCategory getBookPageByCategory(int pageNo, @Param("category") String category);
	public int selectCountByCategory(String category);
	public BookListSearch getBookSearch(int pageNo,@Param("searchKey") String searchKey);


}
