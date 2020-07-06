package com.epbooks.www.admin.service;

import com.epbooks.www.admin.command.AdmianAuthInfo;

public interface AdminInfoService {

//	관리자 로그인
	AdmianAuthInfo authenticate(String adminId, String adminPassword);
	
}
