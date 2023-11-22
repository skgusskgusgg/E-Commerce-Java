package org.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/join/*")
@Log4j
@AllArgsConstructor
public class JoinController {
	@GetMapping("join")
	public void joinList() {
		log.info("join get 페이지");
	}
}
