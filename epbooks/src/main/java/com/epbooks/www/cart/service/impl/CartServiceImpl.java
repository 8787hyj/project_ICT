package com.epbooks.www.cart.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.cart.dto.Cart;
import com.epbooks.www.cart.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	
	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Autowired
	CartDao cartDao;

	//select
	@Override
	public List<Map<String,Object>> SecletMycartAll(String memberid) {
		return cartDao.SecletMycartAll(memberid);
	}

	//update
	
	// 상세페이지에서 장바구니 버튼을 눌렀을 때, 이미 담긴 도서의 수량을 늘릴때 사용하는 메소드
	@Override
	public int UpdateCartAddAmount(String memberid, String isbn){
		int updateResult = cartDao.UpdateCartAddAmount(memberid, isbn);
		return updateResult;
		
	}
	
	// 장바구니 리스트 페이지에서 수량을 변경할 때 사용하는 메소드
	@Override
	public int UpdateCartChangeAmount(int cartAmount, String isbn, String memberid) {
		int changeAmountResult = cartDao.UpdateCartChangeAmount(cartAmount, isbn, memberid);
		return changeAmountResult;
		
	}
	

	//insert
	@Override
	public int insertCart(String memberid , int amount , String isbn) {
		Cart cart = new Cart();
		cart.setCartAmount(amount);
		cart.setIsbn(isbn);
		cart.setMemberId(memberid);
		int insertCartResult = cartDao.insertCart(cart);
		return insertCartResult;
	}

	//delete

	@Override
	public int deleteCartOne(String isbn, String memberid){
		int deleteBookResult = cartDao.deleteCartOne(isbn,memberid);
		return deleteBookResult;
	}
	
	
	
}
