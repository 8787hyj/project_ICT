package com.epbooks.www.board.dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

public class Board {

	private int boardNo; /* 게시글번호 */
	private String boardTitle; /* 제목 */
	private String boardContent; /* 내용 */
	@DateTimeFormat(pattern ="yyyy-MM-dd a HH:mm")
    private LocalDateTime boardRegdate; /* 작성일 */
	@Nullable
	private Date boardModdate; /* 수정일 */
    private String memberId; /* 사용자ID */
    
    public Board() {}
    
	public Board(String memberId) {
		this.memberId = memberId;
	}

	public Board(int boardNo, String boardTitle, String boardContent, LocalDateTime boardRegdate, Date boardModdate,
			String memberId) {
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardRegdate = boardRegdate;
		this.boardModdate = boardModdate;
		this.memberId = memberId;
	}
	
	public Board(String boardTitle, String boardContent, String memberId) {
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberId = memberId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public LocalDateTime getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(LocalDateTime boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	public Date getBoardModdate() {
		return boardModdate;
	}

	public void setBoardModdate(Date boardModdate) {
		this.boardModdate = boardModdate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegdate=" + boardRegdate + ", boardModdate=" + boardModdate + ", memberId=" + memberId + "]";
	}
    
	
}
