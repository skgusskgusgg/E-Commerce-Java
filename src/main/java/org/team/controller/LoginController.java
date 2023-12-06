package org.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.member.LoginService;
import org.team.member.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

    @Autowired
    private LoginService memberService;

    @PostMapping(value = "/login")
    @ResponseBody
    public String memberlogin(HttpServletRequest request, @RequestBody MemberVO mVO) throws Exception {
        HttpSession session = request.getSession();
        log.info("세션 얻어오기");
        MemberVO member = memberService.memberLogin(mVO);
        log.info("작동");
        session.setAttribute("mVO", member);
        log.info("로그인 요청 받음: " + mVO.getEmail()); // 추가된 로그
        if (member != null) {
            if (member.getAuth() == 1) {
                session.setAttribute("loginOK", 99);
                log.info("admin" + member.getAuth());
                return "admin";
            } else {
                session.setAttribute("loginOK", 1);
                log.info("admin" + member.getAuth());
                return "user";
            }
        } else {
            int result = 0;
            session.setAttribute("result", result);
            return "fail";
        }
    
}

	
	
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
}