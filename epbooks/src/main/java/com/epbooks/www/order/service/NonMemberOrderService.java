package com.epbooks.www.order.service;

import java.util.Map;

import com.epbooks.www.order.dto.NonMember;
import com.epbooks.www.order.dto.OrderList;

public interface NonMemberOrderService {
	
	//비회원 테이블에 추가
	public Map<String, Object> insertNonMember(NonMember nonMember, OrderList orderList);

	//이메일 중복체크
	public int checkEmail(String nonMemberEmail) throws Exception;
	
	public Map<String, Object> nonMemberOrderList(int nonMemberId, String nonMemberEmail);
	
}