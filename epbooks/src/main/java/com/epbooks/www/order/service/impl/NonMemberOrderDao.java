package com.epbooks.www.order.service.impl;

import com.epbooks.www.order.dto.OrderList;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.order.dto.NonMember;

public interface NonMemberOrderDao {
	
	public boolean insertNonMember(NonMember nonMember);
	public Map<String,Object> selectNonMemberID(NonMember nonMember);
	public boolean insertNonMemberOrder(int nonMemberID);
	
	public int selectNonMemberOrderNo(int nonMemberID);
	public void insertNonMemberOrderList(OrderList orderList);
	
	//이메일 중복확인
	public int checkEmail(@Param("nonMemberEmail")String nonMemberEmail);
	
	//비회원 주문 리스트 조회
	public Map<String,Object> selectnonMemberOrderList(@Param("nonMemberId") int nonMemberId, @Param("nonMemberEmail") String nonMemberEmail);
}