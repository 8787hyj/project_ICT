package com.epbooks.www.comment.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epbooks.www.comment.dto.Comment;
import com.epbooks.www.comment.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	//댓글 목록
	@Override
	public List<Comment> readComment(@Param("no") int no) {
		return commentDao.readComment(no);
	}

	//댓글 작성
	@Override
	public void writeComment(Comment comment) {
		commentDao.writeComment(comment);
	}

	@Override
	public void deleteComment(@Param("commentNo") int commentNo) {
		commentDao.deleteComment(commentNo);
	}
	
	
	
}
