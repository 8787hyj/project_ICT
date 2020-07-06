package com.epbooks.www.memberRegister.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.member.dto.Member;
import com.epbooks.www.memberRegister.command.MemberRegisterRequest;
import com.epbooks.www.memberRegister.service.MemberRegisterService;

@Service
@Transactional
public class MemberRegisterServiceImpl implements MemberRegisterService {
	
	@Autowired
	private MemberRegisterDao memberRegisterDao;
	
	@Override
	public void registerMember(MemberRegisterRequest memberRegisterRequest) {
		Member member = new Member(memberRegisterRequest.getMemberID(),
				memberRegisterRequest.getPassword(),
				memberRegisterRequest.getName(),
				memberRegisterRequest.getEmail(),
				memberRegisterRequest.getPhone(),
				2000);
		memberRegisterDao.registerMember(member);		
	}

	//아이디 중복 확인
	@Override
	public int checkSignup(String memberid) throws Exception {
		int result = memberRegisterDao.checkSignup(memberid);
		return result;
	}

	@Override
	public int checkSignupEmail(String email) throws Exception {
		System.out.println("서비스임플>>>>>>>email " + email);
		int result = memberRegisterDao.checkSignupEmail(email.trim());
		System.out.println("서비스임플>>>>>>>result " + result);
		return result;
	}
	
	@Override
	public int registerMemberByKakao(Member member) {
		int result=memberRegisterDao.registerMemberByKakao(member);
		return result;
	}
	
}