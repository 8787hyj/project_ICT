package com.epbooks.www.search.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface UserDao {

	// 아이디 찾기
	public Map<String, Object> search(@Param("email")String email);
	
	// 유저 password 찾기
	public Map<String, Object> searchPassword(@Param("memberid")String memberid); 
}
