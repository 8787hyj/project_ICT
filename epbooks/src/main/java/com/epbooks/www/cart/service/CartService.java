package com.epbooks.www.cart.service;

import java.util.List;
import java.util.Map;

public interface CartService {
	// select
//	public List<Cart> selectMycartByUserIdAndIsbn(String memberid, String isbn);

	public List<Map<String,Object>> SecletMycartAll(String memberid);
	// insert
	public int insertCart(String memberid , int amount , String isbn);
	// update
	public int UpdateCartAddAmount(String memberid, String isbn); // 이미 장바구니에 담긴 도서를 또 장바구니에 담으려고할때 수량만 늘려줌
	public int UpdateCartChangeAmount(int cartAmount, String isbn, String memberid);
	// delete
	public int deleteCartOne(String isbn, String memberid);
}
