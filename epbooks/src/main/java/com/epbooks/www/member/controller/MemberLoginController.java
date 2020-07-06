package com.epbooks.www.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.epbooks.www.common.exception.member.WrongIdPasswordException;
import com.epbooks.www.member.command.AuthInfo;
import com.epbooks.www.member.command.LoginCommand;
import com.epbooks.www.member.dto.Member;
import com.epbooks.www.member.service.MemberService;
import com.epbooks.www.member.validator.LoginCommandValidator;
import com.epbooks.www.memberRegister.service.MemberRegisterService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/login") // 루트 밑에 login으로 들어오는 요청은 이 컨트롤러가 처리함
public class MemberLoginController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberRegisterService memberRegisterService;


	@GetMapping
    public String form(
		LoginCommand loginCommand,
		@CookieValue(value = "REMEMBER", required = false) 
		Cookie rCookie) {
			if (rCookie != null) {
				loginCommand.setMemberId(rCookie.getValue());
				loginCommand.setRememberMemberId(true);
			}
	    	return "member/loginForm";
    }

    @PostMapping
    public String submit(
    		LoginCommand loginCommand, 
    		Errors errors, 
    		HttpSession session,
    		HttpServletResponse response) {
		        new LoginCommandValidator().validate(loginCommand, errors);
		        if (errors.hasErrors()) {
		            return "member/loginForm";
		        }
		        try {
		            AuthInfo authInfo = memberService.authenticate(
		                    loginCommand.getMemberId(),
		                    loginCommand.getPassword());
		            
		            session.setAttribute("authInfo", authInfo);
		
					Cookie rememberCookie = 
							new Cookie("REMEMBER", loginCommand.getMemberId());
					rememberCookie.setPath("/");
					if (loginCommand.isRememberMemberId()) {
						rememberCookie.setMaxAge(60 * 60 * 24 * 30);
					} else {
						rememberCookie.setMaxAge(0);
					}
					response.addCookie(rememberCookie);
		
		            return "redirect:/";
		        } catch (WrongIdPasswordException e) {
		            errors.reject("idPasswordNotMatching");
		            return "member/loginForm";
		        }
    }
    
    @RequestMapping("/Kakao")
    public String KakaoLogin(
    		LoginCommand loginCommand,
    		HttpServletRequest req,
    		HttpServletResponse res,
    		@RequestParam(value="value", required = false) String result,
    		Errors errors,
    		HttpSession session
    		) throws JsonParseException, JsonMappingException, IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
    	Map<String, Object> map2 = new HashMap<String, Object>();
    	String phone="010-1111-2222";
    	int point=2000;
//    	System.out.println("value>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result);
    	
		try {
			ObjectMapper mapper = new ObjectMapper();
			map = mapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			map2=(Map<String, Object>) map.get("kakao_account");
			
			String memberid=Integer.toString((int) map.get("id"));
			String password=Integer.toString((int) map.get("id"));
			String email=(String) map2.get("email");
			
			if(email==null) {
				email="aa@aa.com";
			}
			
			map2=(Map<String, Object>) map.get("properties");
			
			String name=(String) map2.get("nickname");
			
			Member member=new Member(memberid, password, name, email, phone, point, memberid);
			
			
			int registerSearchKakao = memberService.selectMemberByIdCount(memberid, password);
			if(registerSearchKakao==0) {
				int registerKakao=memberRegisterService.registerMemberByKakao(member);
			}
			AuthInfo authInfo = memberService.authenticate(memberid,password);
            
            session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = 
					new Cookie("REMEMBER", memberid);
			rememberCookie.setPath("/");
			if (loginCommand.isRememberMemberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			res.addCookie(rememberCookie);

            return "redirect:/";
        } catch (WrongIdPasswordException e) {
            errors.reject("idPasswordNotMatching");
            return "member/loginForm";
        }
    	
    }
    
    
    
}
