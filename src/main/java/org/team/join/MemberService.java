package org.team.join;



public interface MemberService {
	public void register(MemberDTO member) throws Exception;
	
	public int emailCheck(String email) throws Exception;

}
