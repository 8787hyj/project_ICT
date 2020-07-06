package com.epbooks.www.change.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.epbooks.www.change.service.MemberchangePasswordService;
import com.epbooks.www.member.command.AuthInfo;

@Controller
@RequestMapping("/change")
public class ChangePasswordController {

	@Autowired
	private MemberchangePasswordService memberchangePasswordService;

	@GetMapping
	public String loginForm() {
		return "/changePassword/changePassword"; //비밀번호 변경 폼 jsp
	}

	@PostMapping
	public String submit(@RequestParam("newpassword") String newpassword, HttpSession session) throws Exception {

		AuthInfo member = (AuthInfo) session.getAttribute("authInfo");
		
		if (member != null) {

			int changePasswordResult = memberchangePasswordService.changePassword(newpassword, member.getMemberId());
			
			if (changePasswordResult > 0) {
				return "redirect:/"; //메인 페이지로
			}
			return "/member/loginForm"; //로그인 페이지

		} else {
			return "/member/loginForm";
		}
	}

}
