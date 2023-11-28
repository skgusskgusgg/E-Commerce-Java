package org.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.member.MemberService;
import org.team.member.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping(value = "/login")
    @ResponseBody
    public String memberlogin(HttpServletRequest request, @RequestBody MemberVO mVO) throws Exception {
        HttpSession session = request.getSession();
        log.info("세션 얻어오기");
        MemberVO member = memberService.memberLogin(mVO);
        log.info("작동");
        session.setAttribute("mVO", member);
        if (member != null) {
            if (member.getEmail().equals("admin")) {
                session.setAttribute("loginOK", 99);
                return "success";
            } else {
                session.setAttribute("loginOK", 1);
                return "success";
            }
        } else {
            int result = 0;
            session.setAttribute("result", result);
            return "failure";
        }
    
}

	
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
}