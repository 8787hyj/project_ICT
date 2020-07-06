package com.epbooks.www.article.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.article.dto.Article;
import com.epbooks.www.article.dto.ArticleContent;
import com.epbooks.www.article.dto.ArticleList;


public interface ArticleDao {

	//select
	public List<Article> selectArticleAll();
	//articleNo 받아서 게시글 상세보기
	public List<Map<String, Object>> selectArticleById(int articleno);
	
	//insert
	public int articleWrite(Article article);
	public int articleContentWrite(ArticleContent articleContent);
	
	//update
	public void modifyArticle(@Param("title")String title , @Param("no") int no);
	public void modifyArticleContent(@Param("content") String content, @Param("no") int no);
	//조회수 증가
	public boolean upreadCnt(int no);
	
	//delete
	public void deleteArticle(@Param("no") int no);
	public void deleteArticleContent(@Param("no") int no);
	
	//페이징 처리를 위한 메소드
	public ArticleList getArticlePage(int pageNo);
	public List<Article> selectArticleCount(@Param("startrow") int startrow, @Param("size") int size);
	public int selectCount();
	public String checkSecretArticle(@Param("memberId")String memberId, @Param("noVal")int noVal);
	
	
	
	
}
