package com.epbooks.www.order.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epbooks.www.order.dto.NonMember;
import com.epbooks.www.order.dto.OrderList;
import com.epbooks.www.order.service.NonMemberOrderService;

@Service
public class NonMemberOrderServiceImpl implements NonMemberOrderService {

	@Autowired
	NonMemberOrderDao orderDao;
	
	@Override
	public Map<String,Object> insertNonMember(NonMember nonMember, OrderList orderList) {
		Map<String,Object> result = new HashMap<>();
		if(orderDao.insertNonMember(nonMember) == true) { //비회원 insert 해주었다면
			result = orderDao.selectNonMemberID(nonMember); //비회원 번호를 검색해줌
			
			System.out.println("nonMemberID >>>>>>>>>>>>>>>>>>> " + result.get("nonMemberID"));
			
			//검색한 비회원번호로 오더디비에 넣어줌 
			if(orderDao.insertNonMemberOrder((int)result.get("nonMemberID")) == true) { //비회원이 주문을 넣었다면
				int nonMemberOrderNo = orderDao.selectNonMemberOrderNo((int)result.get("nonMemberID")); //주문번호를 검색해줌
				System.out.println(nonMemberOrderNo);
				
				orderList.setOrderNo(nonMemberOrderNo);
				
				int orderListResult = orderList.getOrderNo();
				System.out.println(orderListResult);
				
				orderDao.insertNonMemberOrderList(orderList); //검색해준 주문번호를 주문리스트테이블에 넣어줌
			}
		}
		return result;
	}
	
	//이메일 중복 확인
	@Override
	public int checkEmail(String nonMemberEmail) throws Exception {
		int result = orderDao.checkEmail(nonMemberEmail);
		return result;
	}

	@Override
	public Map<String,Object> nonMemberOrderList(int nonMemberId, String nonMemberEmail) {
		Map<String,Object> nonMemberOrderList = orderDao.selectnonMemberOrderList(nonMemberId, nonMemberEmail);
		System.out.println("nonMemberOrderList: " + nonMemberOrderList);
		
		return nonMemberOrderList;
	}
	
}