package com.epbooks.www.comment.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {

	private int commentNo;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private LocalDate commentDate;
	private String commentContent;
	private int articleNo;
	private String adminId;

	public Comment() {
	}
	
	

	public Comment(int commentNo, LocalDate commentDate, String commentContent, int articleNo, String adminId) {
		super();
		this.commentNo = commentNo;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.articleNo = articleNo;
		this.adminId = adminId;
	}

	public Comment(String adminId, int articleNo,String commentContent) {
		this.commentContent = commentContent;
		this.articleNo = articleNo;
		this.adminId = adminId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public LocalDate getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDate commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

}
