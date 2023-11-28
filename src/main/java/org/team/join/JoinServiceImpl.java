package org.team.join;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.MemberMapper;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void register(MemberDTO member) throws Exception{
		membermapper.register(member);
	}

	@Override
	public int emailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.emailCheck(email);
	}
	 



}
