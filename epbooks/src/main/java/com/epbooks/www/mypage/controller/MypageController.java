package com.epbooks.www.mypage.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epbooks.www.common.Util;
import com.epbooks.www.common.exception.common.FailDeleteException;
import com.epbooks.www.common.exception.common.FailUpdateException;
import com.epbooks.www.member.command.AuthInfo;
import com.epbooks.www.member.service.MemberService;
import com.epbooks.www.mypage.service.MypageService;
import com.epbooks.www.mypage.service.impl.MypageDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired
	MypageDao mypageDao;
	@Autowired
	MypageService mypageService;
	@Autowired
	MemberService memberService;

	@GetMapping
	public String mypageMain(Model model, HttpSession session) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		
		List<Map<String, String>> purchaseHistoryList = mypageService.selectPurchaseHistoryList(member.getMemberId());
		
		model.addAttribute("resultmap", purchaseHistoryList);
		return "/mypage/mypage";
	}

	@GetMapping("/changeMemberInfo")
	public String changeMemberInfo(Model model, HttpSession session) {
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		
		Map<String, String> memberInfoForChangeMemberInfoMap = mypageService
				.selectMemberInfoForChangeMemberInfo(member.getMemberId());
		
		model.addAttribute("member", memberInfoForChangeMemberInfoMap);
		return "/mypage/changeMemberInfo";

	}

	@PostMapping("/update")
	@ResponseBody
	public ResponseEntity<Object> updateMemberInfo(HttpSession session,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "phone", required = false) String phone) {
		
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		
		String memberid = member.getMemberId();
		String info = "";
		int updateResult = 0;

		if (email != null) { // Email Update
			info = email;
			updateResult = mypageService.updateMemberEmail(info, memberid); 
		}else if (address != null) { // Address Update
			info = address;
			updateResult = mypageService.updateMemberAddress(info, memberid);
		}else if (phone != null) { // PhoneNumber Update
			info = phone;
			updateResult = mypageService.updateMemberPhone(info, memberid);
		}
		
		if(updateResult < 1 ) {
				throw new FailUpdateException();
		}
		
		return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);

	}// end method

	@GetMapping("/deleteMember")
	public String deleteMemberPage() {
		return "/mypage/deletePage";
	}

	@PostMapping("/deleteMemberCheckInfo")
	@ResponseBody
	public ResponseEntity<Object> deleteMemberForm(HttpSession session, @RequestParam("password") String password) {
		
		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");

		logger.info("password " + password);

		if (password != null) {
			boolean result = memberService.deleteMember(member.getMemberId(), password);
			if (result) {
				 session.invalidate();
				 return ResponseEntity.status(HttpStatus.OK).body(Util.SUCCESS);
			}
		}	
	
		throw new FailDeleteException();

	}// end method

	
}
