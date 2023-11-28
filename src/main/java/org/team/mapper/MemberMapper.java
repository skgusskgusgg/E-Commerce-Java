package org.team.mapper;


import org.team.member.MemberVO;

import org.team.join.MemberDTO;

public interface MemberMapper {
	
	//회원가입
	public void register(MemberDTO member);
	public int emailCheck(String email);
  public MemberVO memberLogin(MemberVO mVO);

}
