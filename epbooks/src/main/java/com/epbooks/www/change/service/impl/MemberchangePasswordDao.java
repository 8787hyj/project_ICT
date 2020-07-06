package com.epbooks.www.change.service.impl;

import org.apache.ibatis.annotations.Param;


public interface MemberchangePasswordDao {

	public int changePasswordDao(@Param("newpassword") String newpassword , @Param("memberid") String memberid);

}
