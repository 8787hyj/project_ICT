package com.epbooks.www.article.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.epbooks.www.admin.command.AdmianAuthInfo;
import com.epbooks.www.article.dto.Article;
import com.epbooks.www.article.dto.ArticleContent;
import com.epbooks.www.article.dto.ArticleList;
import com.epbooks.www.article.service.ArticleService;
import com.epbooks.www.book.dto.BookListCategory;
import com.epbooks.www.comment.dto.Comment;
import com.epbooks.www.comment.service.CommentService;
import com.epbooks.www.common.Util;
import com.epbooks.www.member.command.AuthInfo;
import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;

@Controller
@RequestMapping("/article")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CommentService commentService;

	// 게시판 조회 / 페이징
	@RequestMapping("/list")
	public String articleList(HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam(value = "pageNo", required = false) String pageNoVal) {
		logger.info(">>>>>>>>>>>>>list");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}

//		List<Article> list = articleService.selectArticleAll();
//		model.addAttribute("articles", list);

		ArticleList articleList = articleService.getArticlePage(pageNo);
		req.setAttribute("articleList", articleList);
		logger.info("ar>>>>>"+articleList.getContent());
		
		if (req.getServletPath().equals("/article/list")) {
			return "article/articlelistForm";
		}
		return "/article/articlelistForm";
	}

	// Article 리스트 출력해주기위해 Form으로 보내주는 메소드였는데 페이징 처리와 합침
	/*
	 * @GetMapping("/list") public String articleForm(Model model) { List<Article>
	 * list = articleService.selectArticleAll(); model.addAttribute("articles",
	 * list); return "/article/articlelistForm"; }
	 */

	// write작성하기form
	@GetMapping("/write")
	public void articleWrtie(HttpSession session, HttpServletResponse response) {

		if (session.getAttribute("authInfo") == null) {
			print(Util.FAIL, response);
		} else {
			print(Util.SUCCESS, response);
		}
	}

	@GetMapping("/writeForm")
	public String articleWrtieForm(HttpSession session, HttpServletResponse response) {
		return "/article/articlewriteForm";
	}

	@PostMapping("/articlewritedo")
	public String articleWrite(HttpSession session, @RequestParam String title, @RequestParam String content,
			@RequestParam(required = false) boolean secret) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		int articleInsertResult = 0;
		int articleContentInsertResult = 0;
		
		  logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>user" + user.getMemberId());
		  logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>title" + title); //
		  logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>secret" + secret);
		 
		Article article = new Article(user.getMemberId(), title, secret);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>acrticle" + article.getArticleNo());
		articleInsertResult = articleService.writeArticle(article);
		if (articleInsertResult > 0) {
			logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>after!!!!!acrticle" + article.getArticleNo());
			ArticleContent articleContent = new ArticleContent(article.getArticleNo(), content);
			articleContentInsertResult = articleService.writeArticleContent(articleContent);
		} else {
			return "epbooksMain";
		}

		return "redirect:/article/list";
	}

	@GetMapping("/secretCheck")
	public void readArticleBeforeCheck(HttpServletRequest req, HttpServletResponse res, @RequestParam("no") String no,
			@RequestParam("secret") String secret) throws IOException {
		AuthInfo user = (AuthInfo) req.getSession(false).getAttribute("authInfo");
		AdmianAuthInfo admin = (AdmianAuthInfo) req.getSession().getAttribute("adminAuthInfo");
		int noVal = Integer.parseInt(req.getParameter("no"));
		logger.info("user>>>>>>>>>>>" + user);
		logger.info("admin>>>>>>>>>>>" + admin);
		logger.info("noVal>>>>>>>>>>>" + noVal);
		logger.info("secret>>>>>>>>>>>" + secret);
		
		if (secret.equals("비공개") || secret.contains("비")) {
			if (user != null) {
				boolean result = articleService.checkSecretArticle(user.getMemberId(), noVal);
				if (result)	print(Util.SUCCESS, res);
				else print(Util.FAIL, res);
			}else if(admin != null) {
				boolean result = articleService.selectArticleById(noVal) != null;
				if(result)print(Util.SUCCESS, res);
				else print(Util.FAIL, res);
			} 
			else {
				print(Util.FAIL, res);
			}
		} else {
			print(Util.NOSECRET, res);
		}
	}

	// 게시글 상세보기
	@GetMapping("/read")
	public String readArticle(HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam("no") int no) throws IOException {
		int articleno = Integer.parseInt(req.getParameter("no"));
		
		Map<String, Object> resultMap = articleService.selectArticleById(articleno);
		logger.info("resultMap>>>>>>>>>>>>>>>>>>>" + resultMap);
		//articleService.upreadCnt(no);
		model.addAttribute("read", resultMap);

		// 게시글 상세보기할때 해당 게시글의 댓글 보기
		List<Comment> commentList = commentService.readComment(Integer.parseInt(req.getParameter("no")));
		model.addAttribute("commentList", commentList);
		logger.info(">>>>>>commentList" + commentList); 
		// 조회수증가
		articleService.upreadCnt(no);
		model.addAttribute("read", resultMap);

		return "/article/articlereadForm";
	}

	// article 수정form
	@GetMapping("/modify")
	public String modifyArticle(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		String noVal = req.getParameter("no");
		logger.info(noVal);
		int no = Integer.parseInt(noVal);
		model.addAttribute("articleModify", articleService.selectArticleById(no));
		return "/article/articlemodifyForm";
	}

	@PostMapping("/articlemodifydo")
	public String articleModify(HttpServletRequest req, HttpServletResponse res) {
		// logger.info("수정컨트롤러>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		// 인터셉터로 체크할 내용AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int no = Integer.parseInt(req.getParameter("no"));
		//logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + title + " / " + content + " / " + no);
		articleService.modifyArticle(title, no);
		articleService.modifyArticleContent(content, no);
		return "redirect:/article/list";
	}

	@GetMapping("/delete")
	public String deleteArticle(HttpServletRequest req, HttpServletResponse res) {
		//logger.info("delete컨트롤러>>>>>>>>>>>>>");
		int no = Integer.parseInt(req.getParameter("no"));
		//logger.info(">>>>>>>>>>>>" + no);
		articleService.deleteArticleContent(no);
		articleService.deleteArticle(no);
		return "redirect:/article/list";
	}

	@PostMapping("/commentWrite")
	public void commentWrite(HttpSession session, HttpServletRequest req, HttpServletResponse response,
			@RequestParam("articleNo") String articleNo, @RequestParam("content") String content,
			@RequestParam("adminId") String adminId) throws IOException {
		PrintWriter out = response.getWriter();
		//logger.info(">>>>articleNo, content, adminId" + articleNo + " / " + content + " / " + adminId);

		/* articleNo = comment.setArticleNo(Integer.parseInt(articleNo)); */

		// String articleNo = req.getParameter("no");
		// 관리자가 로그인했을때만 댓글 작성가능
		/*
		 * AdminInfo adminInfo = (AdminInfo) session.getAttribute("adminInfo");
		 * logger.info(">>>>>>>>>>>>>>>>>admin" + adminInfo.getAdminId()); Comment
		 * comment = new Comment(adminInfo.getAdminId(), commentContent);
		 */
		// AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		// commentService.writeComment();
//		logger.info(">>>>>"+comment);
		out.println("success");

		Comment comment = new Comment(adminId, Integer.parseInt(articleNo), content);
		//logger.info("comment" + comment);
		commentService.writeComment(comment);
	}

	@PostMapping("/commentDelete")
	public void commentDelete(@RequestParam("commentNo") int commentNo, HttpServletResponse response)
			throws IOException {
		//logger.info("commentNo" + commentNo);
		commentService.deleteComment(commentNo);
		PrintWriter out = response.getWriter();
		out.println("success");
	}

	// print 메소드
	private void print(String string, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(string);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
