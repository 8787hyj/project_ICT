package com.epbooks.www.article.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epbooks.www.article.controller.ArticleController;
import com.epbooks.www.article.dto.Article;
import com.epbooks.www.article.dto.ArticleContent;
import com.epbooks.www.article.dto.ArticleList;
import com.epbooks.www.article.service.ArticleService;
import com.epbooks.www.book.dto.Book;
import com.epbooks.www.book.dto.BookListCategory;

@Service
public class ArticleServiceImpl implements ArticleService {

	private static final Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);
	@Autowired
	ArticleDao articleDao;

	@Autowired
	private ArticleService articleService;
	ArticleContent articleContent;

	// Article 리스트
	@Override
	public List<Article> selectArticleAll() {
		return articleDao.selectArticleAll();
	}

	// Article 작성
	@Override
	public int writeArticle(Article article) {
//		Article article = new Article(articlecommand.getArticleNo(),articlecommand.getMemberId(),articlecommand.getTitle(),articlecommand.getRegdate());
		int result = articleDao.articleWrite(article);
		return result;
	}

	// ArticleContent 작성
	@Override
	public int writeArticleContent(ArticleContent articleContent) {
		int result = articleDao.articleContentWrite(articleContent);
		return result;
	}

	// Date 타입이 들어있어 값을 string형변환할 수없어 Object로 받아줌
	// 게시판 상세보기 서비스 selectArticleById
	@Override
	public Map<String, Object> selectArticleById(int articleno) {
		List<Map<String, Object>> listMap = articleDao.selectArticleById(articleno);
		Map<String, Object> resultMap = new HashMap<>();

		for (int i = 0; i < listMap.size(); i++) {
			for (Entry<String, Object> elem : listMap.get(i).entrySet()) {
				resultMap.put(elem.getKey(), elem.getValue());
			}
		}
		logger.info(">>>>>>>>>>>>>>>>>>>ArticleServiceImpl");
		return resultMap;
	}

	// modifyArticle
	@Override
	public void modifyArticle(String title, int no) {
		articleDao.modifyArticle(title, no);

	}

	// modifyArticleContent
	@Override
	public void modifyArticleContent(String content, int no) {
		articleDao.modifyArticleContent(content, no);
	}

	// deleteArticle
	@Override
	public void deleteArticle(int no) {
		articleDao.deleteArticle(no);
	}

	// deleteArticleContent
	@Override
	public void deleteArticleContent(int no) {
		articleDao.deleteArticleContent(no);
	}

	// upreadCnt 조회수 증가
	@Override
	public boolean upreadCnt(int no) {
		return articleDao.upreadCnt(no);
	}

	@Override
	public ArticleList getArticlePage(int pageNo) {
		int result = 0;
		int size = 10;
		List<Article> content = null;
		result = articleService.selectCount();

		if (result == 0) {
			System.out.println("articleListPageService result null");
		}

		content = selectArticleCount((pageNo - 1) * size, size);
		if (content == null) {
			System.out.println("articleListService content null");
		}
		return new ArticleList(result, pageNo, size, content);
	}

	@Override
	public List<Article> selectArticleCount(int startrow, int size) {
		List<Article> result = new ArrayList<Article>();
		result = articleDao.selectArticleCount(startrow, size);
		System.out.println(result+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		if (result == null) {
			System.out.println("result null");
		}
//		System.out.println("result null");

		return result;
	}

	@Override
	public int selectCount() {
		int articleCount = 0;
		articleCount = articleDao.selectCount();
		if (articleCount == 0) {
			System.out.println("articleCount is null222");
		}
		return articleCount;
	}

	// 비밀글 확인용
	@Override
	public boolean checkSecretArticle(String memberId, int noVal) {
		boolean result = false;

		String secret = articleDao.checkSecretArticle(memberId, noVal);
		if (secret != null) {
			if (secret.equals("1")) {
				result = true;
				logger.info("result>>>>>" + result);
			}
		}
		return result;
	}

}
