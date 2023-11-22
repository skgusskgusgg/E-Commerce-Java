package org.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
@AllArgsConstructor
public class FaQController {
	
	@GetMapping("/faqList")
	public void faqList() {
		log.info("FaQ리스트페이지");
	}
	
	@GetMapping("/faqDetail")
	public void detaile() {
		log.info("QnA 디테일 페이지");
	}
}
