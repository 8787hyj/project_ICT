package com.epbooks.www.order.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.book.dto.Book;
import com.epbooks.www.order.dto.MemberOrder;
import com.epbooks.www.order.dto.MemberOrderList;
import com.epbooks.www.order.service.MemberOrderService;

@Service
@Transactional
public class MemberOrderServiceImpl implements MemberOrderService {

	@Autowired
	private MemberOrderDao memberOrderDao;

	@Override
	public int insertMemberOrder(MemberOrder memberId) {

		memberOrderDao.insertMemberOrder(memberId);
		int result = memberOrderDao.selectOrderNumLast();
//		System.out.println("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + result);
		return result;

	}

	@Override
	public Map<String, String> selectPurchaseHistoryList(String memberId) {

		Map<String, String> Member = memberOrderDao.selectMemberInfoForChangeMemberInfo(memberId);

		return Member;
	}

	@Override
	public int insertMemberOrderList(Map<String, Object> map, int memberOrderNo) {
		//List<MemberOrder> list = new ArrayList<MemberOrder>(amount,memberOrderNo,isbn)
//		Map<String, Object> resultMap = new HashMap<>();
//		List<Object> list=new ArrayList<Object>();
		int result=0;
		
//		System.out.println("serviceimpl map>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+map);
//		System.out.println("serviceimpl memberOrderNo>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrderNo);
		
		List<String> isbnex=(List<String>) map.get("isbn");
		List<String> amountex=(List<String>) map.get("amount");
		
//		System.out.println("isbn>>>>>>>>>>>>>>>>>>>>>>>>>>>"+isbnex);
//		System.out.println("amount>>>>>>>>>>>>>>>>>>>>>>>>>>>"+amountex);
		
		for(int i=0; i<isbnex.size(); i++) {
			String isbn=isbnex.get(i);
			int amount=Integer.parseInt(amountex.get(i));
			
			result = memberOrderDao.insertMemberOrderListMap(amount,isbn,memberOrderNo);
		}
		
		return result;


	}

	@Override
	public List<Integer> selectMemberOrderNoAll(String memberId) {
		List<Integer> memberOrderNo = memberOrderDao.selectMemberOrderNoAll(memberId);
//		System.out.println("memberno>>>>>>>>>>>>>>>>>>>>>>>>>>" + memberOrderNo);
		return memberOrderNo;
	}

	@Override
	public List<MemberOrder> selectMemberOrderList(List<Integer> memberOrderNo) {
		Map<String, Object> map = new HashMap<>();

		map.put("memberOrderNo", memberOrderNo);

		List<MemberOrder> memberOrders = memberOrderDao.selectMemberOrderList(map);

		return memberOrders;
	}

	@Override
	public MemberOrderList getMemberOrderList(int pageNo, String memberId) {
		int result = 0;
		int size = 5;
		List<MemberOrder> content = null;

		result = selectCountMemberOrder(memberId);

		if (result == 0) {
			System.out.println("orderListPageService result null");
		}

		content = selectMemberOrderCount((pageNo - 1) * size, size, memberId);

		
//		System.out.println("content>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+content);
		
		return new MemberOrderList(result, pageNo, size, content);
	}

	private List<MemberOrder> selectMemberOrderCount(int startrow, int size, String memberID) {
		List<MemberOrder> result = new ArrayList<MemberOrder>();;

		result = memberOrderDao.selectMemberOrderList(startrow, size, memberID);
//		System.out.println("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result);
		if (result == null) {
			System.out.println("result null");
		}

		return result;
	}

	private int selectCountMemberOrder(String memberId) {
		int orderCount = 0;
		
//		System.out.println("memberID>>>>>>>>>>>>>>>>>>>>"+memberId);
		orderCount = memberOrderDao.selectCountSearch(memberId);

//		System.out.println("orderCount>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+orderCount);
		if (orderCount == 0) {
			System.out.println("orderCount is null222");
		}

		return orderCount;
	}

	@Override
	public MemberOrder selectMemberOrderDetail(String orderNo) {
		MemberOrder memberOrder=memberOrderDao.selectMemberOrderDetail(orderNo);
//		System.out.println("memberOrderService>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrder);
		return memberOrder;
	}

	@Override
	public MemberOrder selectBookListByIsbn(String isbn) {
		
		MemberOrder memberOrder = memberOrderDao.selectMemberOrderBook(isbn);
		
		return memberOrder;
	}

	@Override
	public int memberUpdate(String name,String adress,String phone,String email,String memberId) {
		int memberUpdate = memberOrderDao.updateMember(name,adress,phone,email,memberId);
		
		return memberUpdate;
	}

	// 장바구니에서 넘어오는 결제 목록 관련
	@Override
	public List<Map<String, Object>> selectCartForOrder(Map<String, Object> map) {
		String memberInfo = "";
		List<Map<String, Object>> orderList = new ArrayList<Map<String,Object>>();
		
		for(Map.Entry<String,Object> entry : map.entrySet()){
			memberInfo = entry.getValue().toString().replace("[", "").replace("]", "");
		}
		
		String sp[] = memberInfo.split(",");
		
		for(int i = 0; i < sp.length ; i++) {
			map = memberOrderDao.selectCartForOrder(sp[i].trim());
			orderList.add(map);
		}
		return orderList;
	}

}
