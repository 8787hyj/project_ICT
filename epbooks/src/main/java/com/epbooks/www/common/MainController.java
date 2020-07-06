package com.epbooks.www.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.epbooks.www.article.service.ArticleService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private ApplicationContext applicationContext;
	@Autowired
	private ArticleService articleService;

	// get 방식으로 /에 접근했을때 처리하도록 매핑
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, 
			@RequestParam(value = "pageNo", required = false) String pageNoVal) {
		// 등록된 Bean을 확인하기 위함. log로 현재 등록된 Bean의 이름을 출력한다.
		String[] beanNames = applicationContext.getBeanDefinitionNames();

		for (String beanName : beanNames) {
			logger.info("----------------------------------------------------------------------");
			logger.info(beanName + " : " + applicationContext.getBean(beanName).getClass().toString());
		}

		return "index";
	}
	
}