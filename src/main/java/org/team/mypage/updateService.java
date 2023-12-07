package org.team.mypage;

import org.team.join.MemberDTO;

public interface updateService {
	public int update(MemberDTO member);
	public int passwordCheck(MemberDTO member);
	
	
}
