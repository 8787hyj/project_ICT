package com.epbooks.www.member.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.member.dto.Member;


public interface MemberDao {
	// select - 로그인
	public Member selectById(String memberId);
	// select - 회원 리스트
	public List<Member> selectMemberAllDao();
	
	
	// select - 멤버가 있나 없나만 조회 - 추가된 부분(박소라)
	public int selectMemberByIdCount(@Param("memberid") String memberId, @Param("password") String password);
	
	// delete - 추가된 부분(박소라)
	public int deleteMember(@Param("memberid") String memberId, @Param("password") String password);
	// 밥먹고 서비스쪽 마저 확인하기
}
