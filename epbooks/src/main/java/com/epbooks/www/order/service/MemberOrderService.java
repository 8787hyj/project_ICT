package com.epbooks.www.order.service;

import java.util.List;
import java.util.Map;

import com.epbooks.www.order.dto.MemberOrder;
import com.epbooks.www.order.dto.MemberOrderList;

public interface MemberOrderService {

	int insertMemberOrder(MemberOrder memberOrder);

	Map<String, String> selectPurchaseHistoryList(String memberId);

	List<MemberOrder> selectMemberOrderList(List<Integer> memberOrderNoAll);

	List<Integer> selectMemberOrderNoAll(String memberId);

	MemberOrderList getMemberOrderList(int pageNo, String memberId);

	MemberOrder selectMemberOrderDetail(String orderNo);

	MemberOrder selectBookListByIsbn(String isbn);

	int memberUpdate(String memberId, String adress, String phone, String email, String memberId2);

	List<Map<String, Object>> selectCartForOrder(Map<String, Object> map);

	int insertMemberOrderList(Map<String, Object> map, int memberOrderNo);



}
