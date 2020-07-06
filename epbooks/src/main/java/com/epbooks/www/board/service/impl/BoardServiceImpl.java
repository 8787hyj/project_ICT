package com.epbooks.www.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epbooks.www.board.controller.BoardController;
import com.epbooks.www.board.dto.Board;
import com.epbooks.www.board.dto.BoardList;
import com.epbooks.www.board.service.BoardService;
import com.epbooks.www.common.exception.common.EntityNotFoundException;

@Service
public class BoardServiceImpl implements BoardService {
	final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardService boardService;
	
	//게시판 리스트 보기
	@Override
	public List<Board> selectBoardAll(String memberId) {
		return boardDao.selectBoardAll(memberId);
	}
	

	//페이징 처리
	@Override
	public BoardList getBoardPage(int pageNo) {
		int result = 0;
		int size = 9;
		List<Board> content = null;
		result = boardService.selectCount();
		
		if (result == 0) {
			logger.info("No article in table");
		}
		content = selectBoardCount((pageNo - 1)* size, size);
		
		if (content == null) {
			logger.info("No article in table");
		}
		
		return new BoardList(result, pageNo, content, size);
	}

	//카운트
	@Override
	public int selectCount() {
		
		int boardCount = 0;
		boardCount = boardDao.selectCount();
		return boardCount;
	}

	@Override
	public List<Board> selectBoardCount(int startrow, int size) {
		List<Board> result = new ArrayList<Board>();
		result = boardDao.selectBoardCount(startrow, size);
		
		return result;
	}

	//게시판 작성 
	@Override
	public void boardWrite(Board board) {
		boardDao.boardWrite(board);
	}

	//게시글 상세보기
	//Date 타입이 들어있어 값을 string형변환할 수없어 Object로 받아줌
	@Override
	public Map<String, Object> selectBoardById(int boardNo) {
		
		List<Map<String, Object>> listMap = boardDao.selectBoardById(boardNo);
		Map<String, Object> resultMap = new HashMap<>();
		
		for(int i = 0 ; i < listMap.size() ; i++) {
			for(Entry<String, Object> elem : listMap.get(i).entrySet()) {
				resultMap.put(elem.getKey(), elem.getValue());
			}
		}
		return resultMap;
	}
	
	//게시판 (제목, 내용) 수정 post
	@Override
	public void boardModify(String title, String content, int no) {
		boardDao.boardModify(title, content, no);
	}

	//게시글 삭제
	@Override
	public void boardDelete(int no) {
		boardDao.boardDelete(no);
	}

}
