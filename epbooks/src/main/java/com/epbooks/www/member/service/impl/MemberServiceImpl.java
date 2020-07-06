package com.epbooks.www.member.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.common.exception.member.WrongIdPasswordException;
import com.epbooks.www.member.command.AuthInfo;
import com.epbooks.www.member.dto.Member;
import com.epbooks.www.member.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public AuthInfo authenticate(String memberId, String password) {
		Member member = memberDao.selectById(memberId);
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		if (!member.matchPassword(password)) {
			throw new WrongIdPasswordException();
		}
		return new AuthInfo(
				member.getMemberid(),
				member.getEmail(),
				member.getName());
	}


	// 여기 아래 부분 추가 - 박소라
	
	@Override
	public boolean deleteMember(String memberId , String password) {
		int deleteResult = memberDao.deleteMember(memberId,password);
		boolean result = false;
		if(deleteResult > 0)
			return result = true;
		else 
		return result;
	}


	@Override
	public int selectMemberByIdCount(String memberid, String password) {
		int result = memberDao.selectMemberByIdCount(memberid,password);
		return result;
	}


}
