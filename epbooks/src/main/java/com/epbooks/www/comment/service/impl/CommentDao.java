package com.epbooks.www.comment.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.comment.dto.Comment;

public interface CommentDao {

	//댓글 조회
	public List<Comment> readComment(@Param("no")int no);
	
	//댓글 작성
	public void writeComment(Comment comment);

	//댓글 삭제
	public void deleteComment(@Param("commentNo")int commentNo);
	
	
}
