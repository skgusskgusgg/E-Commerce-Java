package org.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/qna/*")
@Log4j
public class QnAController {

	@GetMapping("/qnaList")
	public void list() {
		log.info("QnA페이지");
	}
	@GetMapping("/qnaDetail")
	public void detaile() {
		log.info("QnA 디테일 페이지");
	}
}
