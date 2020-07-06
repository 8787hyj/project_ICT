package com.epbooks.www.article.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import com.epbooks.www.member.dto.Member;

public class Article {

	private int articleNo;
	private String memberId;
	private String title;
	@DateTimeFormat(pattern ="yyyyMMdd")
	private LocalDate regdate;
	@Nullable
	@DateTimeFormat(pattern ="yyyyMMdd")
	private LocalDate moddate;
	@Nullable
	private int readCnt;
	private boolean secret;

	public Article() {
		// TODO Auto-generated constructor stub
	}


	public Article(String memberId, String title, boolean secret) {
		this.memberId = memberId;
		this.title = title;
		this.secret = secret;
	}
	
	public Article(int articleNo, String memberId, String title, LocalDate regdate, boolean secret) {
		this.articleNo = articleNo;
		this.memberId = memberId;
		this.title = title;
		this.regdate = regdate;
		this.secret = secret;
	}

	public Article(int articleNo, String memberId, String title, LocalDate regdate, LocalDate moddate, boolean secret) {
		this.articleNo = articleNo;
		this.memberId = memberId;
		this.title = title;
		this.regdate = regdate;
		this.moddate = moddate;
		this.secret = secret;
	}
	
	public Article(int articleNo, String memberId, String title, LocalDate regdate) {
		this.articleNo = articleNo;
		this.memberId = memberId;
		this.title = title;
		this.regdate = regdate;
	}

	
	
	public Article(String memberid, String title) {
		this.memberId = memberid;
		this.title = title;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberid(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDate getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDate regdate) {
		this.regdate = regdate;
	}

	public LocalDate getModdate() {
		return moddate;
	}

	public void setModdate(LocalDate moddate) {
		this.moddate = moddate;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public boolean isSecret() {
		return secret;
	}

	public void setSecret(boolean secret) {
		this.secret = secret;
	}

	@Override
	public String toString() {
		return "Article [articleNo=" + articleNo + ", memberId=" + memberId + ", title=" + title + ", regdate="
				+ regdate + ", moddate=" + moddate + ", readCnt=" + readCnt + ", secret=" + secret + "]";
	}
}
