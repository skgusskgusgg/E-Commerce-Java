package org.team.mapper;

import org.team.join.MemberDTO;

public interface MemberMapper {
	
	//회원가입
	public void register(MemberDTO member);
	public int emailCheck(String email);

}
