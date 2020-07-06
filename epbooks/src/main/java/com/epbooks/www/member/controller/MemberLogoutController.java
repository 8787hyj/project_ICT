package com.epbooks.www.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MemberLogoutController {
	@RequestMapping("/logout") // 루트 밑에 logout으로 들어온 요청을 처리
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
