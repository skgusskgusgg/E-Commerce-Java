package org.team.mapper;


import org.team.join.MemberDTO;
import org.team.member.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void register(MemberDTO member);
	public int emailCheck(String email);
	public MemberVO memberLogin(MemberVO mVO);
	public int update(MemberDTO member);
	public int passwordCheck(MemberDTO member);

}
