package com.epbooks.www.comment.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.comment.dto.Comment;

public interface CommentService {

	//댓글 조회
	public List<Comment> readComment(@Param("no")int no);
	
	//댓글 작성
	public void writeComment(Comment comment);

	public void deleteComment(@Param("commentNo")int commentNo);
	
}
