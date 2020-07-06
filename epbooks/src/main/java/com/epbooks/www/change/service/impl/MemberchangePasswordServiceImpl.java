package com.epbooks.www.change.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.change.service.MemberchangePasswordService;
import com.epbooks.www.common.exception.common.BusinessException;

@Service
@Transactional
public class MemberchangePasswordServiceImpl implements MemberchangePasswordService {

	@Autowired
	MemberchangePasswordDao memberchangePasswordDao;
	
	@Override
	public int changePassword(String newpassword, String memberid) {
		
		int changePasswordResult = memberchangePasswordDao.changePasswordDao(newpassword,memberid);
		
		return changePasswordResult;
	}

}
