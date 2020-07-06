package com.epbooks.www.book.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.book.dto.Book;
import com.epbooks.www.book.dto.BookList;
import com.epbooks.www.book.dto.BookListCategory;
import com.epbooks.www.book.dto.BookListSearch;
import com.epbooks.www.book.service.BookService;

@Service
@Transactional
public class BookServiceImpl implements BookService{

	private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	
	@Autowired
	BookDao bookdao;

	@Override
	public Book selectBookById(String isbn) {
//		logger.info("isbn>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+isbn);
		Book book=bookdao.selectBookById(isbn);

		if(book==null) {
			logger.info("book null");
		}else if(!book.matchISBN(isbn)) {
			System.out.println("isbn not match");
		}
		return new Book(book.getISBN(), book.getTitle(), book.getPricesales(), book.getDesciption(), book.getBookAmount(), book.getAuthor(), book.getCategory(), book.getPublisher(), book.getBookimage());
	}

	@Override
	public List<Book> selectBookAll() {
		List<Book> list=bookdao.selectBookAll();
		if(list==null) {
			System.out.println("list is null");
		}
		return list;
	}
	
	@Override
	public int selectCount() {
		
		int bookCount=0;

		bookCount=bookdao.selectCount();
		
		
		

		if(bookCount==0) {
			System.out.println("bookCount is null222");
		}
		return bookCount;
		
	}

	@Override
	public List<Book> selectBookCount(int startrow, int size) {

		List<Book> result = new ArrayList<Book>();
		result=bookdao.selectBookCount(startrow, size);
		if(result==null) {
			System.out.println("result null");
		}

		
		return result;
	}

	@Override
	public BookList getBookPage(int pageNum) {

		int result=0;
		int size = 9;
		List<Book> content=null;
		

		result = selectCount();

		if(result==0) {
			System.out.println("bookListPageService result null");
		}


		content=selectBookCount((pageNum - 1)* size , size);

		if(content==null) {
			System.out.println("bookListPageService content null");
		}
		

		
		
		return new BookList(result, pageNum, size, content);
	}

	@Override
	public BookListCategory getBookPageByCategory(int pageNo, String category) {
		int result=0;
		int size = 9;
		List<Book> content=null;
		
		result = selectCountByCategory(category);

		if(result==0) {
			System.out.println("bookListPageService result null");
		}

		content=selectBookCountByCategory((pageNo - 1)* size , size,category);

		if(content==null) {
			System.out.println("bookListPageService content null");
		}

		
		
		return new BookListCategory(result, pageNo, size, content);
	}

	private List<Book> selectBookCountByCategory(int startrow, int size, String category) {
		List<Book> result = new ArrayList<Book>();
		result=bookdao.selectBookCountByCategory(startrow, size,category);
		if(result==null) {
			System.out.println("result null");
		}
		
		return result;
	}

	@Override
	public int selectCountByCategory(String category) {
		int bookCount=0;

		bookCount=bookdao.selectCountByCategory(category);

		if(bookCount==0) {
			System.out.println("bookCount is null222");
		}
		return bookCount;
	}

	@Override
	public BookListSearch getBookSearch(int pageNo, String searchKey) {
		int result=0;
		int size = 9;
		List<Book> content=null;
		
		result = selectCountSearch(searchKey);

//		logger.info("service11>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		if(result==0) {
			System.out.println("bookListPageService result null");
		}

//		logger.info("service22>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		content=selectBookCountSearch((pageNo - 1)* size , size,searchKey);

//		logger.info("service33>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		if(content==null) {
			System.out.println("bookListPageService content null");
		}

		
		
		return new BookListSearch(result, pageNo, size, content);
	}

	private List<Book> selectBookCountSearch(int startrow, int size, String searchKey) {
		List<Book> result = new ArrayList<Book>();
//		logger.info("dao11>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		result=bookdao.selectBookCountSearch(startrow, size,searchKey);
		if(result==null) {
			System.out.println("result null");
		}
//		logger.info("dao12>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		return result;
	}

	private int selectCountSearch(String searchKey) {
		int bookCount=0;

//		logger.info("dao21>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		bookCount=bookdao.selectCountSearch(searchKey);

		if(bookCount==0) {
			System.out.println("bookCount is null222");
		}
		
//		logger.info("dao22>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		return bookCount;
	}





	
}
