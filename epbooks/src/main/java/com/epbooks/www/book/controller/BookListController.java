package com.epbooks.www.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.epbooks.www.book.dto.Book;
import com.epbooks.www.book.dto.BookList;
import com.epbooks.www.book.dto.BookListCategory;
import com.epbooks.www.book.dto.BookListSearch;
import com.epbooks.www.book.service.BookService;
import com.epbooks.www.book.service.impl.BookServiceImpl;
import com.mysql.cj.Session;
import com.mysql.cj.protocol.ServerSession;

@Controller
@RequestMapping("/book")
public class BookListController {

	@Autowired
	private BookService bookservice;
	private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	
	@RequestMapping("/search")
	public String bookSearch(HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam(value="searchKey") String searchKey,
			@RequestParam(value = "pageNo", required = false) String pageNoVal
			) {
		
		
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		if(searchKey==null) {
			System.out.println("searchkey>>>>>>>>>>>>>>>>>"+searchKey);
			return "book/bookSearchFail";
		}
		
		BookListSearch booklistsearch = bookservice.getBookSearch(pageNo, searchKey);
		req.setAttribute("booklistsearch", booklistsearch);
		req.setAttribute("searchKey", searchKey);

		if(booklistsearch==null) {
			return "book/bookSearchFail";
		}
		
		return "book/bookSearchList";
		
	}
	
	@RequestMapping("/book/search")
	public String bookSearch2(HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam(value="searchKey") String searchKey,
			@RequestParam(value = "pageNo", required = false) String pageNoVal
			) {
		
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		if(searchKey==null) {
			System.out.println("searchkey>>>>>>>>>>>>>>>>>"+searchKey);
			return "book/bookSearchFail";
		}
		
		BookListSearch booklistsearch = bookservice.getBookSearch(pageNo, searchKey);
		req.setAttribute("booklistsearch", booklistsearch);
		req.setAttribute("searchKey", searchKey);

		if(booklistsearch==null) {
			return "book/bookSearchFail";
		}
		
		return "book/bookSearchList";
		
	}
	
	
	@RequestMapping(value = { "/booklist", "/booklist1", "/booklist2", "/booklist3", "/booklist4", "/booklist5" })
	public String bookList(HttpServletRequest req,
			HttpServletResponse res, 
			Model model,
			@RequestParam(value = "pageNo", required = false) String pageNoVal
			,@RequestParam(value = "category", required = false) String category
			) {
		
//		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>1");

		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}

		BookList booklist = bookservice.getBookPage(pageNo);
//		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>2" + booklist.getContent());
		if(booklist!=null) {
		req.setAttribute("booklist", booklist);
		}
		BookListCategory booklistbycategory = null;
		
		if (req.getServletPath().equals("/book/booklist")) {
//			logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>3");
			return "book/bookListMain";
		}
		if (req.getServletPath().equals("/book/booklist1")) {
			
			if(category==null) {
				category="A";
			}
			booklistbycategory = bookservice.getBookPageByCategory(pageNo,category);
			req.setAttribute("booklistbycategory", booklistbycategory);
			
			return "book/bookList1";
		}
		if (req.getServletPath().equals("/book/booklist2")) {
			
			if(category==null) {
				category="B";
			}
			booklistbycategory = bookservice.getBookPageByCategory(pageNo,category);
			req.setAttribute("booklistbycategory", booklistbycategory);
			
			return "book/bookList2";
		}
		if (req.getServletPath().equals("/book/booklist3")) {
			
			if(category==null) {
				category="C";
			}
			booklistbycategory = bookservice.getBookPageByCategory(pageNo,category);
			req.setAttribute("booklistbycategory", booklistbycategory);
			
			return "book/bookList3";
		}
		if (req.getServletPath().equals("/book/booklist4")) {
			
			if(category==null) {
				category="D";
			}
			booklistbycategory = bookservice.getBookPageByCategory(pageNo,category);
			req.setAttribute("booklistbycategory", booklistbycategory);
			
			return "book/bookList4";
		}
		if (req.getServletPath().equals("/book/booklist5")) {
			
			if(category==null) {
				category="E";
			}
			booklistbycategory = bookservice.getBookPageByCategory(pageNo,category);
			req.setAttribute("booklistbycategory", booklistbycategory);
			
			return "book/bookList5";
		}
		return "redirect:/";
	}

	@GetMapping("/detail")
		public String bookDetailList(HttpServletRequest req,
				HttpServletResponse res,
				Model model,
				@RequestParam(value = "isbn", required = false) String isbn
				) {
		
			isbn = req.getParameter("isbn");
			logger.info("isbn>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+isbn);
				Book bookDetail = bookservice.selectBookById(isbn);
//				logger.info("bookdetail>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+bookDetail);
				req.setAttribute("bookdetail", bookDetail);
				//System.out.println("req.getServletContext(): "+req.getServletContext());
				return "book/bookDetailPage";
			}
	
	@GetMapping("/book/detail")
	public String bookDetailList2(HttpServletRequest req,
			HttpServletResponse res,
			Model model,
			@RequestParam(value = "isbn", required = false) String isbn
			) {
	
		isbn = req.getParameter("isbn");
//		logger.info("isbn>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+isbn);
			Book bookDetail = bookservice.selectBookById(isbn);
//			logger.info("bookdetail>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+bookDetail);
			req.setAttribute("bookdetail", bookDetail);
			//System.out.println("req.getServletContext(): "+req.getServletContext());
			return "book/bookDetailPage";
		}
}


