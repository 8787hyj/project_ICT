package com.epbooks.www.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epbooks.www.book.dto.Book;
import com.epbooks.www.book.service.BookService;
import com.epbooks.www.member.command.AuthInfo;
import com.epbooks.www.order.dto.OrderList;
import com.epbooks.www.order.dto.NonMember;
import com.epbooks.www.order.service.NonMemberOrderService;
import com.epbooks.www.order.service.impl.MemberOrderDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.epbooks.www.member.service.MemberService;
import com.epbooks.www.order.dto.MemberOrder;
import com.epbooks.www.order.dto.MemberOrderList;
import com.epbooks.www.order.service.MemberOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private NonMemberOrderService orderService;

	@Autowired
	private MemberOrderService memberOrderService;

	@Autowired
	private BookService bookService;
	

	OrderList orderList = new OrderList();

	@GetMapping
	public String order(HttpServletRequest req, HttpServletResponse res, Model model, @RequestParam("isbn") String isbn,
			@RequestParam("amount") int amount) throws IOException {

		// orderList에 도서번호, 수량 추가
		orderList.setISBN(isbn);
		orderList.setOrderAmount(amount);

		List<Object> list = new ArrayList<Object>();
		list.add(Integer.parseInt(req.getParameter("amount")));
		list.add(req.getParameter("isbn"));

		AuthInfo member = (AuthInfo) req.getSession(false).getAttribute("authInfo");
		if (member != null) { // 회원일 때
			String memberid = member.getMemberId();
			Map<String, String> purchaseHistoryList = memberOrderService
					.selectPurchaseHistoryList(member.getMemberId());
			model.addAttribute("resultmap", purchaseHistoryList);
			MemberOrder booklist = memberOrderService.selectBookListByIsbn(req.getParameter("isbn"));
			model.addAttribute("booklist", booklist);
			Map<String, Object> mem = new HashMap<String, Object>();
			mem.put("mem", list);
			model.addAttribute("memberOrder", mem);

			return "order/MemberOrder";

		} else { // 비회원일 때
			model.addAttribute("amount", amount);
			model.addAttribute("isbn", isbn);

			isbn = req.getParameter("isbn");
			Book nonMemberBookList = bookService.selectBookById(isbn);
			model.addAttribute("Book", nonMemberBookList);

			return "/nonMember/nonMemberOrderForm"; // 비회원 주문 페이지 폼
		}
		// 주문 실패 페이지를 넣어줘야 함
	}

	// 회원 장바구니에서 결제페이지로 넘기기
	@GetMapping("/fromcart")
	public String cartOrder(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model,
			@RequestParam("result") String result)  {
		Map<String, Object> map = new HashMap<String, Object>();
		AuthInfo member = (AuthInfo) request.getSession(false).getAttribute("authInfo");
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			map = mapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
					
			if (member != null) { //회원일 때
				// 세션의 멤버아이디로 멤버 정보 조회하여, 주문 form에 주소 , 번호 등 정보 뿌려줌
				Map<String, String> purchaseHistoryList = memberOrderService.selectPurchaseHistoryList(member.getMemberId());
				model.addAttribute("resultmap", purchaseHistoryList);
				
				List<Map<String, Object>> cartOrderList = memberOrderService.selectCartForOrder(map);
				
				model.addAttribute("cartList",cartOrderList);
			}
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "order/MemberOrder";

	}

	// 비회원 주문하기
	@PostMapping("/nonMemberOrderdo")
	public String register(Model model, NonMember nonMember) { // 비회원일때 결제 버튼 클릭시
		System.out.println("controller: " + nonMember);
		// 비회원 정보 insert
		Map<String, Object> nonMemberMap = orderService.insertNonMember(nonMember, orderList);
		model.addAttribute("nonMember", nonMemberMap);
		return "/nonMember/nonMemberOrderSucess"; // 비회원 주문 성공 페이지
	}

	// 비회원 이메일 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public String checkEmail(HttpServletRequest request, Model model) throws Exception {
		String nonMemberEmail = request.getParameter("nonMemberEmail");
		System.out.println(nonMemberEmail + " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ");

		int rowcount = orderService.checkEmail(nonMemberEmail);
		System.out.println(rowcount + " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ");

		return String.valueOf(rowcount);
	}

	// 비회원 주문 성공하면 메인으로 돌아가기
	@RequestMapping("main")
	public String main() {
		return "redirect:/";
	}

	// 비회원 주문 조회 정보입력 폼
	@RequestMapping("/nonMemberOrderSearchdo")
	public String nonMemberOrderSearch() {
		return "/nonMember/nonMemberOrderSearch"; // 비회원 주문조회하기 위한 정보입력 페이지
	}

	// 비회원 번호, 비회원 이메일로 주문내역 검색
	@RequestMapping("/nonMemberOrderList")
	public String nonMemberList(Model model, @RequestParam("nonMemberId") int nonMemberId,
			@RequestParam("nonMemberEmail") String nonMemberEmail) {
		System.out.println(nonMemberId);
		System.out.println(nonMemberEmail);

		Map<String, Object> orderList = orderService.nonMemberOrderList(nonMemberId, nonMemberEmail);
		model.addAttribute("orderList", orderList);

		return "/nonMember/nonMemberOrderList"; // 주문 내역페이지가 나와야 함
	}

	// 회원

	@RequestMapping("/memberOrder")
	public String memberOrder(HttpServletRequest req,
			HttpServletResponse res, 
			Model model,
			HttpSession session,
			@RequestParam(value = "result") String result
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		String memberId = user.getMemberId();
		ObjectMapper mapper = new ObjectMapper();
		try {
			map = mapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			
//			System.out.println("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result);
			
//			System.out.println(map);
			
			String name=(String) map.get("name");
			String address=(String) map.get("address");
			String email=(String) map.get("email");
			String phone=(String) map.get("phone");
			
			MemberOrder memberOrder = new MemberOrder();
			memberOrder.setMemberId(memberId);
			
			int memberUpdate = memberOrderService.memberUpdate(name, address, phone, email, memberId);
//			System.out.println("memberUpdate>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memberUpdate);
			
			int memberOrderNo = memberOrderService.insertMemberOrder(memberOrder);
//			System.out.println("memberorderno>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrderNo);
			
			int memberOrderListNo = memberOrderService.insertMemberOrderList(map,memberOrderNo);
//			System.out.println("memberOrderListNo>>>>>>>>>>>>>>>>>>>>>>>"+memberOrderListNo);
			
			
			model.addAttribute("orderNo",memberOrderNo);
			
			//따온부분
//			List<Map<String, Object>> cartOrderList = memberOrderService.selectCartForOrder(map);
			
//			model.addAttribute("cartList",cartOrderList);

			
			//내가 한부분들
//			int memberUpdate = memberOrderService.memberUpdate(name, adress, phone, email, memberId);
////			System.out.println("memberUpdate>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memberUpdate);
	//
//			MemberOrder memberOrder = new MemberOrder();
//			memberOrder.setMemberId(memberId);
//			int memberOrderNo = memberOrderService.insertMemberOrder(memberOrder);
////			System.out.println("memberorderno>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrderNo);
//			int memberOrderListNo = memberOrderService.insertMemberOrderList(amount, memberOrderNo, isbn);

			return "order/MemberOrderSuccess";
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "order/MemberOrderFail";
		
	}

	@RequestMapping("/MemberOrderList")
	public String memberOrderList(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session,
			@RequestParam(value = "pageNo", required = false) String pageNoVal) {
		AuthInfo user = (AuthInfo) session.getAttribute("authInfo");
		String memberId = user.getMemberId();

		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		MemberOrderList memberOrderList = memberOrderService.getMemberOrderList(pageNo, memberId);
//		List<Integer> memberOrderNoAll=memberOrderService.selectMemberOrderNoAll(memberId);
//		System.out.println("memberOrderList>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrderList);
//		List<MemberOrder> memberOrderList=memberOrderService.selectMemberOrderList(memberOrderNoAll);
		model.addAttribute("memberOrderL", memberOrderList);

		return "order/MemberOrderList";

	}

	@RequestMapping("/memberOrderDetail")
	public String memberOrderDetail(HttpServletRequest req, HttpServletResponse res, Model medel, HttpSession session,
			@RequestParam("memberOrderNo") String orderNo) {

//		System.out.println("orderno>>>>>>>>>>>>>>>>>>>>>>>>>"+orderNo);
		MemberOrder memberOrder = memberOrderService.selectMemberOrderDetail(orderNo);
		medel.addAttribute("memberOrder", memberOrder);

//		System.out.println("memberOrder>>>>>>>>>>>>>>>>>>>>>>>>>>"+memberOrder);
		return "order/MemberOrderDetail";

	}

}
