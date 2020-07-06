package com.epbooks.www.member.service;

import com.epbooks.www.member.command.AuthInfo;

public interface MemberService {
			
	// 회원 로그인 id, password
//	public AuthInfo selectMemberById(String memberid,String password);
	public AuthInfo authenticate(String memberId, String password);
	
	//여기 아래부분 추가 박소라
	public int selectMemberByIdCount(String memberid,String password);

	public boolean deleteMember(String memberId, String password);
	
}
