package com.epbooks.www.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.admin.command.AdmianAuthInfo;
import com.epbooks.www.admin.dto.Admin;
import com.epbooks.www.admin.service.AdminInfoService;
import com.epbooks.www.common.exception.member.WrongIdPasswordException;

@Service
@Transactional
public class AdminInfoServiceImpl implements AdminInfoService {

	@Autowired
	AdminDao adminDao;

//	관리자 로그인
	@Override
	public AdmianAuthInfo authenticate(String adminId, String adminPassword) {
		Admin admin = adminDao.selectById(adminId);
		if (admin == null) {
			throw new WrongIdPasswordException();
		}
		if (!admin.matchPassword(adminPassword)) {
			throw new WrongIdPasswordException();
		}
		return new AdmianAuthInfo(
				admin.getAdminId(),
				admin.getAdminPassword());
	}

}
