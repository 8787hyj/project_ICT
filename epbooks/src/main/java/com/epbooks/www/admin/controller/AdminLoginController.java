package com.epbooks.www.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epbooks.www.admin.command.AdmianAuthInfo;
import com.epbooks.www.admin.command.AdminCommand;
import com.epbooks.www.admin.service.AdminInfoService;
import com.epbooks.www.admin.validator.AdminCommandValidator;
import com.epbooks.www.common.exception.member.WrongIdPasswordException;


@Controller
@RequestMapping("/admin")
public class AdminLoginController {

	@Autowired
	private AdminInfoService adminInfoService;

	@GetMapping
    public String form(
    	HttpSession session,	
    	AdminCommand adminCommand,
		@CookieValue(value = "REMEMBER", required = false) 
		Cookie rCookie) {
		
			if (rCookie != null) {
				adminCommand.setAdminId(rCookie.getValue());
				adminCommand.setRememberAdminId(true);
			}
			
			AdmianAuthInfo adminAuthInfo = (AdmianAuthInfo) session.getAttribute("adminAuthInfo");
			if (adminAuthInfo != null) {
				return "admin/adminLoginSuccess";
			}
	    	return "admin/adminLogin";
    }

    @PostMapping
    public String submit(
    		AdminCommand adminCommand, 
    		Errors errors, 
    		HttpSession session,
    		HttpServletResponse response) {
		        new AdminCommandValidator().validate(adminCommand, errors);
		        if (errors.hasErrors()) {
		            return "admin/adminLogin";
		        }
		        try {
		        	AdmianAuthInfo adminAuthInfo = adminInfoService.authenticate(
		        			adminCommand.getAdminId(),
		        			adminCommand.getAdminPassword());
		            
		            session.setAttribute("adminAuthInfo", adminAuthInfo);
		
					Cookie rememberCookie = 
							new Cookie("REMEMBER", adminCommand.getAdminId());
					rememberCookie.setPath("/");
					if (adminCommand.isRememberAdminId()) {
						rememberCookie.setMaxAge(60 * 60 * 24 * 30);
					} else {
						rememberCookie.setMaxAge(0);
					}
					response.addCookie(rememberCookie);
					System.out.println("AdminLoginController");
		            return "admin/adminLoginSuccess";
		        } catch (WrongIdPasswordException e) {
		            errors.reject("idPasswordNotMatching");
		            return "admin/adminLogin";
		        }
    }
    
    @RequestMapping("/logout") // 루트 밑에 logout으로 들어온 요청을 처리
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
