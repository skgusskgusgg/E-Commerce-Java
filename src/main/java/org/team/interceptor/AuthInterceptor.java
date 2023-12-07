package org.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
         HttpSession session = request.getSession();
        Integer auth = (Integer) session.getAttribute("loginOK");

        if (auth == null || auth != 99) {
            response.sendRedirect("/");
            return false;
        }
        log.info("login 성공?");
        return true;
    }
}
