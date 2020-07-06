package com.epbooks.www.board.dto;

import java.util.List;

//db에서 조회한 게시글 리스트를 페이징 처리하기 위해 필요한 데이터를 만들어 보관하는 커맨드 객체
public class BoardList {

	private int boardTotal;
	private int boardCurrentPage;
	private List<Board> content;
	private int boardTotalPages;
	private int boardStartPage;
	private int boardEndPage;
	
	public BoardList(int boardTotal, int boardCurrentPage, List<Board> content, int size) {
		this.boardTotal = boardTotal;
		this.boardCurrentPage = boardCurrentPage;
		this.content = content;
		
		if(boardTotal == 0) {
			boardTotalPages = 0;
			boardStartPage = 0;
			boardEndPage = 0;
		} else {
			//게시글 있으면 페이지 수 계산
			boardTotalPages = boardTotal / size;
			if(boardTotal % size > 0) {
				//자투리 있으면 한 페이지 추가
				boardTotalPages++;
			}
			//1. 6페이지 눌렀다 - modVal => 1
			//2. 5페이지 눌렀다 - modVal => 0
			int modVal = boardCurrentPage % 5;
			//1. boardStartPage => 6
			//2. boardStartPage => 6
			boardStartPage = boardCurrentPage / 5*5+1;
			//2. boardStartPage => 1
			if (modVal == 0) {
				boardStartPage -= 5;
			}	
			//1. boardEndPage - 10 => 이전 6,7,8,9,10 다음
			//2. boardEndPage - 5 => 이전 1,2,3,4,5 다음	
			boardEndPage = boardStartPage + 4;
			//계산된 boardEndPage값이 전체 페이지수를 넘으면 거기까지
			if (boardEndPage > boardTotalPages) {
				boardEndPage = boardTotalPages;
			}
		}
		
	}
	//전체 게시글 수가 0이면 true 반환 - 게시글이 없다고 표시
	public boolean hasNoBoard() {
		return boardTotal == 0;
	}
	//위와 반대
	public boolean hasBoard() {
		return boardTotal > 0;
	}
	public int getBoardTotal() {
		return boardTotal;
	}
	public int getBoardCurrentPage() {
		return boardCurrentPage;
	}
	public List<Board> getContent() {
		return content;
	}
	public int getBoardTotalPages() {
		return boardTotalPages;
	}
	public int getBoardStartPage() {
		return boardStartPage;
	}
	public int getBoardEndPage() {
		return boardEndPage;
	}
	
}
