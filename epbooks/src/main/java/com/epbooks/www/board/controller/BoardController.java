package com.epbooks.www.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.epbooks.www.board.dto.Board;
import com.epbooks.www.board.dto.BoardList;
import com.epbooks.www.board.service.BoardService;
import com.epbooks.www.common.advice.CommonControllerAdvice;
import com.epbooks.www.member.command.AuthInfo;

@Controller
@RequestMapping("/board")
public class BoardController {
	final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;


	// 게시판 리스트 보기
	@RequestMapping("/list")
	public String boardList(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam(value = "pageNo", required = false) String pageNoVal) {

		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}

		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		
		if (user == null) {
			return "redirect:/board/check"; // 로그인 하지 않으면 로그인 하라는 메세지 보여주는 jsp
		}

		String memberId = user.getMemberId();

		List<Board> list = boardService.selectBoardAll(memberId);
		
		model.addAttribute("list", list);

		// 페이징 처리
		BoardList boardList = boardService.getBoardPage(pageNo);
		req.setAttribute("boardList", boardList);

		if (req.getServletPath().equals("/board/list")) {
			return "board/boardList";
		}
		return "/board/boardList";
	}

	// 로그인 안했을 때 다시 로그인 하라고 함
	@RequestMapping("/check")
	public String boardCheck() {
		return "/board/sessionCheck";
	}

	// 게시글 작성 get 방식
	@RequestMapping("/write")
	public String boardWrite() {
		return "/board/boardWrite";
	}

	// 게시글 작성 post 방식
	@PostMapping("/writedo")
	public String boardWrite(HttpSession session, @RequestParam String boardTitle, @RequestParam String boardContent) {

		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		
		if (user == null) {
			return "redirect:/board/check"; // 로그인 하지 않으면 로그인 하라는 메세지 보여주는 jsp
		}
		Board board = new Board(boardTitle, boardContent, user.getMemberId());
		boardService.boardWrite(board);

		return "redirect:/board/list";
	}

	// 게시글 상세보기
	@RequestMapping("/detail")
	public String boardDetail(HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestParam("no") int no) {
		String noVal = req.getParameter("no");
		
		int boardNo = Integer.parseInt(noVal);
		
		Map<String, Object> resultMap = boardService.selectBoardById(boardNo);
		
		model.addAttribute("boardDetail", resultMap);

		return "/board/boardDetail";
	}

	// 게시글 수정 get
	@GetMapping("/modify")
	public String boardModify(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model) {
		
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");

		if(user==null) {
			return "redirect:/board/check"; // 로그인 하지 않으면 로그인 하라는 메세지 보여주는 jsp
		}
	
		String noVal = req.getParameter("no");
		
		int no = Integer.parseInt(noVal);
		
		model.addAttribute("boardModify",boardService.selectBoardById(no));
		return"/board/boardModify";
	}

	// 게시글 (제목, 내용) 수정 post
	@PostMapping("/modifydo")
	public String boardModify(HttpServletRequest req, HttpServletResponse res) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int no = Integer.parseInt(req.getParameter("no"));

		if (title == null) {
			return "redirect:/board/check";
		}
		boardService.boardModify(title, content, no);
		return "redirect:/board/list";
	}

	// 게시글 삭제
	@GetMapping("/delete")
	public String boardDelete(HttpServletRequest req, HttpServletResponse res) {
		int no = Integer.parseInt(req.getParameter("no"));
		
		boardService.boardDelete(no);
		
		return "redirect:/board/list";
	}

}
