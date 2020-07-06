package com.epbooks.www.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epbooks.www.common.error.ErrorCode;
import com.epbooks.www.common.error.ErrorResponse;
import com.epbooks.www.common.exception.member.WrongEamilNameException;
import com.epbooks.www.common.exception.member.WrongIdPasswordException;
import com.epbooks.www.search.service.IdSearchService;

@Controller
@RequestMapping("/user")
public class SearchController {

	@Autowired
	private IdSearchService searchService;

	// @GetMapping
	@RequestMapping(value = "/IduserSearch", method = RequestMethod.GET)
	public String IduserSearchForm() {
		return "/user/IduserSearch";
	}

	// @GetMapping
	@RequestMapping(value = "/PassworduserSearch", method = RequestMethod.GET)
	public String PassworduserSearchForm() {
		return "/user/PassworduserSearch";
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/IduserSearch", method = RequestMethod.POST)
	public String searchId(@RequestParam("name") String name, @RequestParam("email") String email) throws Exception {

		String id = "";

		id = searchService.idSearch(name, email);
		if (id == null) {
			throw new WrongIdPasswordException();
		}

		return id;
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/PassworduserSearch", method = RequestMethod.POST)
	public ResponseEntity<Object> searchPassword(@RequestParam("name") String name, @RequestParam("memberid") String memberid,
			@RequestParam("email") String email) throws Exception {
		
			String password = "";

			password = searchService.passwordSearch(name, memberid, email);

			return ResponseEntity.status(HttpStatus.OK).body(password);
		
	}

}
