package com.epbooks.www.memberRegister.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epbooks.www.memberRegister.command.MemberRegisterRequest;
import com.epbooks.www.memberRegister.service.MemberRegisterService;

@Controller
@RequestMapping("/register") // 루트 밑에 register로 들어오는 요청은 이 컨트롤러가 처리함 
//ex) localhost8080:/www/register
public class MemberRegisterController {
	
	@Autowired
	private MemberRegisterService memberRegisterService;


	@GetMapping("/form")
	public String registerForm() {
		return "/memberRegister/memberRegisterForm";
	}
	
	@PostMapping("/registerdo")
	public String register(MemberRegisterRequest memberRegisterRequest) {
		memberRegisterService.registerMember(memberRegisterRequest);
		return "redirect:/"; //DB에 form에서 받은 파라미터 값이 성공적으로 저장되면, 메인화면으로 돌려보낸다.
	}

	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
	public String checkSignup(HttpServletRequest request, Model model) throws Exception { 
		System.out.println("오긴왔음");
		String memberid = request.getParameter("memberid");
		String email = request.getParameter("email");
		
		int rowcount = 0;
		
		if(memberid != null) {
		System.out.println(memberid + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		rowcount = memberRegisterService.checkSignup(memberid);
		System.out.println(rowcount + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		return String.valueOf(rowcount);
		}
		else if(email != null) {
//			System.out.println(email + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			
			rowcount = memberRegisterService.checkSignupEmail(email);
//			System.out.println(rowcount + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			
			return String.valueOf(rowcount);
		}else {
			return String.valueOf(rowcount);
		}
	}

	
}// end of class
