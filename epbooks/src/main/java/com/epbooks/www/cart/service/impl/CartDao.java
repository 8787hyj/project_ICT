package com.epbooks.www.cart.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.epbooks.www.cart.dto.Cart;


public interface CartDao {
	// select
	public int selectMycartByUserIdAndIsbn(@Param("memberid")String memberid, @Param("isbn")String isbn);
	public List<Map<String,Object>> SecletMycartAll(@Param("memberid")String memberid);
	// insert
	public int insertCart(Cart cart);
	// update
	public int UpdateCartAddAmount(@Param("memberid") String memberid, @Param("isbn")String isbn); // 이미 장바구니에 담긴 도서를 또 장바구니에 담으려고할때 수량만 늘려줌
	public int UpdateCartChangeAmount(@Param("cartAmount") int cartAmount, @Param("isbn") String isbn, @Param("memberid") String memberid);
	// delete
	public int deleteCartOne(@Param("isbn") String isbn , @Param("memberid") String memberid);
	
	
	
	
}
