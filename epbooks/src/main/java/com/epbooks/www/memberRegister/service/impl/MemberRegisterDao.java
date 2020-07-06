package com.epbooks.www.memberRegister.service.impl;


import org.apache.ibatis.annotations.Param;

import com.epbooks.www.member.dto.Member;

public interface MemberRegisterDao {
	
	//insert
	public void registerMember(Member member);
	
	//아이디 중복확인
	public int checkSignup(@Param("memberid")String memberid);

	public int checkSignupEmail(@Param("email")String email);
	
	public int registerMemberByKakao(Member member);

}
