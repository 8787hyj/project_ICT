package com.epbooks.www.memberRegister.service;

import org.springframework.stereotype.Service;

import com.epbooks.www.member.dto.Member;
import com.epbooks.www.memberRegister.command.MemberRegisterRequest;

public interface MemberRegisterService {
	
	public void registerMember(MemberRegisterRequest memberRegisterRequest);
	
	//아이디 중복체크
	public int checkSignup(String memberid) throws Exception;
	//이메일 중복체크
	public int checkSignupEmail(String email) throws Exception;
	
	public int registerMemberByKakao(Member member);
}