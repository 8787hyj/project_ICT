package com.epbooks.www.article.dto;

public class ArticleContent {

	
	private int articleno;
	private String content;
	
	public ArticleContent() {
		// TODO Auto-generated constructor stub
	}

	public ArticleContent(int articleno, String content) {
		this.articleno = articleno;
		this.content = content;
	}

	public int getArticleno() {
		return articleno;
	}

	public void setArticleno(int articleno) {
		this.articleno = articleno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
}
