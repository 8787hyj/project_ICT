package com.epbooks.www.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epbooks.www.cart.service.CartService;
import com.epbooks.www.cart.service.impl.CartDao;
import com.epbooks.www.common.Util;
import com.epbooks.www.member.command.AuthInfo;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	CartService cartService;
	@Autowired
	CartDao cartDao;

	// 장바구니 main 페이지
	@GetMapping
	public String mycartMain(HttpSession session, Model model) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		List<Map<String, Object>> resultMap = cartService.SecletMycartAll(member.getMemberId());
		model.addAttribute("cartlist", resultMap);

		return "cart/mycartlist";
	}

	// 도서 장바구니에 추가 - 상세페이지에서
	@PostMapping("/insert")
	@ResponseBody
	public ResponseEntity<Object> addCart(HttpSession session, @RequestParam("isbn") String isbn,
			@RequestParam("amount") String amount) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		int insertAmount = Integer.parseInt(amount);

		int cartCheck = cartDao.selectMycartByUserIdAndIsbn(member.getMemberId(), isbn);

		if (cartCheck > 0) {
			return ResponseEntity.status(HttpStatus.OK).body(Util.DISTINCT);
		}

		cartService.insertCart(member.getMemberId(), insertAmount, isbn);
		
		return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);

	}// end addCart

	@PostMapping("/update")
	@ResponseBody
	public ResponseEntity<Object> changeCartAmount(HttpSession session, @RequestParam("isbn") String isbn,
			@RequestParam("amount") String amount) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		int cartAmount = Integer.parseInt(amount);

		cartService.UpdateCartChangeAmount(cartAmount, isbn, member.getMemberId());

		return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);
	}

	// 도서수량 추가
	@GetMapping("/changeamount")
	@ResponseBody
	public ResponseEntity<Object> cartUpdate(HttpSession session, @RequestParam("isbn") String isbn) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");

		cartService.UpdateCartAddAmount(member.getMemberId(), isbn);

		return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);
	}

	// 도서 삭제
	@PostMapping("/cartdel/{isbn}")
	@ResponseBody
	public ResponseEntity<Object> deleteMycart(@PathVariable String isbn, HttpSession session) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");

		cartService.deleteCartOne(isbn, member.getMemberId());

		return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);
	}

}// end class
