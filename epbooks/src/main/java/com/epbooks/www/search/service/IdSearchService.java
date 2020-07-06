package com.epbooks.www.search.service;


public interface IdSearchService {

	// 아이디 찾기
	public String idSearch(String name, String email);

	// 비밀번호 찾기
	public String passwordSearch(String name, String memberid, String email);
	
	
}
