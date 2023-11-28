package org.team.controller;
<<<<<<< HEAD
=======

>>>>>>> 41591b960ff13fd88a2504f7f2686a6ee800de2c
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.join.MemberDTO;
import org.team.join.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/join/*")
@Log4j

public class JoinController {
	

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("join")
	public void joinList() {
		log.info("join get 페이지");
	}
	//open API ADDRESS 페이지 이동할 때 필요
	@GetMapping("openApiAddress")
	public void oepnApiAddress() {
		log.info("openApiAddress get 페이지");
	}
	//open API ADDRESS 페이지에서 Join페이지로 정보를 갖고 돌아올 때 필요
	@PostMapping("openApiAddress")
	public void oepnApiAddress2() {
		log.info("openApiAddress2 post 페이지");
	}
	@RequestMapping(value="emailCheck", method =RequestMethod.POST)
	@ResponseBody
	public String emailCheck(String email) throws Exception{
		log.info("email중복체크, 받은 email : " + email);
		int result = memberService.emailCheck(email);
		log.info("email체크 결과 : " + result);
		if(result !=0) {
			return "fail";
		}else {
			return "success";
		}
	}
	

	//회원가입 기능)
	@RequestMapping(value="/register", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String register(MemberDTO member) throws Exception {
		
		log.info("register: "+ member);
		memberService.register(member);
		return "redirect:/join/join";
	}
	
	
<<<<<<< HEAD
}
=======
}
>>>>>>> 41591b960ff13fd88a2504f7f2686a6ee800de2c
