package com.epbooks.www.article.dto;

import java.util.List;

//db에서 조회한 게시글 리스트를 페이징 처리하기 위해 필요한 데이터를 만들어 보관하는 커맨드 객체
public class ArticleList {

	private int total;
	private int currentPage;
	private List<Article> content;
	private int totalPages;
	private int startPage;
	private int endPage;

	public ArticleList(int total, int currentPage, int size, List<Article> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;

		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			// 게시글 있으면 페이지 수 계산
			totalPages = total / size;
			if (total % size > 0) {
				// 자투리 있으면 한 페이지 추가
				totalPages++;
			}
			// 1. 6페이지 눌렀다 - modVal => 1
			// 2. 5페이지 눌렀다 - modVal => 0
			int modVal = currentPage % 5;
			// 1. startPage => 6
			// 2. startPage => 6
			startPage = currentPage / 5 * 5 + 1;
			// 2. startPage => 1
			if (modVal == 0)
				startPage -= 5;
			// 1. endPage - 10 => 이전 6,7,8,9,10 다음
			// 2. endPage - 5 => 이전 1,2,3,4,5 다음
			endPage = startPage + 4;
			// 계산된 endPage값이 전체 페이지수를 넘으면 거기까지만 ㅋㅋ
//			System.out.println("booklist page count");
			if (endPage > totalPages)
				endPage = totalPages;
		}
				
	}
	public int getTotal() {
		return total;
	}
	//전체 게시글 수가 0이면 true 반환 - 게시글 없다고 표시해주려고
	public boolean hasNoArticles() {
		return total == 0;
	}
	//위와 반대 ㅋㅋㅋ
	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<Article> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

}
