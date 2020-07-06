package com.epbooks.www.search.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.common.Util;
import com.epbooks.www.common.exception.common.BusinessException;
import com.epbooks.www.common.exception.member.NotFoundMemberException;
import com.epbooks.www.common.exception.member.WrongEamilNameException;
import com.epbooks.www.search.service.IdSearchService;

@Service
@Transactional
public class IdSearchServiceImpl implements IdSearchService {

	@Autowired
	private UserDao userDao;

	// 아이디 찾기
	@Override
	public String idSearch(String name, String email) {

		Map<String, Object> idSearchMap = new HashMap<>();
		String result = "";

		idSearchMap = userDao.search(email);

		if (idSearchMap != null) {
			result = idSearchMap.get("NAME").equals(name) ? (String) idSearchMap.get("MEMBERID") : "CheckName";

		} else {
			result = "NonMember";
		}

		return result;
	}

	// 비밀번호 찾기
	@Override
	public String passwordSearch(String name, String memberid, String email) {

		Map<String, Object> passwordSearchMap = new HashMap<>();
		String result = "";

		passwordSearchMap = userDao.searchPassword(memberid);

		if (passwordSearchMap != null) {
			if (passwordSearchMap.get("name").equals(name) && passwordSearchMap.get("email").equals(email)) 
				result = (String) passwordSearchMap.get("password");
			else 
				throw new WrongEamilNameException(); // 이름 혹은 이메일이 다를때
			
		} else {
			throw new NotFoundMemberException(); // 가입된 회원이 없을때
		}

		return result;
	}

}
