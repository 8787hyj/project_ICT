package com.epbooks.www.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epbooks.www.member.dto.Member;
import com.epbooks.www.member.service.impl.MemberDao;

@Controller
@RequestMapping("/select") // 루트 밑에 select로 들어온 요청을 처리
public class MemberSelectController {
	
	@Autowired
	private MemberDao memberDao;
	

	
	@GetMapping("/all") // get 방식으로 www/select/all 로 접근시 처리하는 메소드
	public String memberSelectAll(Model model) {
		List<Member> members = memberDao.selectMemberAllDao();
		model.addAttribute("members", members);
		return "/member/memberselectAll";
	}
	
}
