package com.epbooks.www.order.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.order.dto.MemberOrder;

public interface MemberOrderDao {
//
	public Map<String, String> selectMemberInfoForChangeMemberInfo(String memberId);

//
	public int insertMemberOrder(MemberOrder memberId);

	public int insertMemberOrderListMap(Map<String, Object> map);//

	public List<Integer> selectMemberOrderNoAll(String memberId);//

	public List<MemberOrder> selectMemberOrderList(Map<String, Object> map);

//	public int insertMemberOrderList(@Param("orderAmount") int orderAmount, @Param("memberOrderNo") int memberOrderNo,
//			@Param("isbn") String isbn);

	public int selectOrderNumLast();

	public int selectCountSearch(String memberId);

	public List<MemberOrder> selectMemberOrderList(@Param("startrow") int startrow, @Param("size") int size,
			@Param("memberId") String memberId);

	public MemberOrder selectMemberOrderDetail(@Param("orderNo") String orderNo);

	public MemberOrder selectMemberOrderBook(String isbn);

	public int updateMember(@Param("name") String name,@Param("adress")  String adress,@Param("phone")  String phone, @Param("email") String email,@Param("memberId")  String memberId);

	// 장바구니 결제 추가
	public Map<String, Object> selectCartForOrder(@Param("isbn")String isbn);

	public int insertMemberOrderListMap(@Param("amount") int amount,@Param("isbn") String isbn,@Param("orderNo") int memberOrderNo);
}
