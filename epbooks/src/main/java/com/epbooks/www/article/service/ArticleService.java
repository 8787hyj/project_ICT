package com.epbooks.www.article.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.article.dto.Article;
import com.epbooks.www.article.dto.ArticleContent;
import com.epbooks.www.article.dto.ArticleList;


public interface ArticleService {

	//select
	public List<Article> selectArticleAll();
	public Map<String, Object> selectArticleById(int articleno);

	//update
	public void modifyArticle(String title , int no);
	public void modifyArticleContent(String content, int no);
	//조회수 증가
	public boolean upreadCnt(int no);
	//insert
	public int writeArticle(Article article);
	public int writeArticleContent(ArticleContent articleContent);
	
	//delete
	public void deleteArticle(int no);
	public void deleteArticleContent(int no);
	
	//페이징 처리
	ArticleList getArticlePage(int pageNo);
	public int selectCount();
	public List<Article> selectArticleCount(@Param("startrow") int startPage, int size);
	
	public boolean checkSecretArticle(String memberId, int noVal);
	

}
