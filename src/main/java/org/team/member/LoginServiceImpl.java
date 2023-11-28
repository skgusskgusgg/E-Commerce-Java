package org.team.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service

public class LoginServiceImpl implements LoginService {
	@Autowired
	MemberMapper memberMapper;
	
	// 회원가입
	
	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO mVO){
		log.info(mVO);
		return memberMapper.memberLogin(mVO);
		
	}

}
