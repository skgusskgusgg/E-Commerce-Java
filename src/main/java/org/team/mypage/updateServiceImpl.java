package org.team.mypage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.join.MemberDTO;
import org.team.mapper.MemberMapper;


@Service
public class updateServiceImpl implements updateService {
	
	@Autowired
	MemberMapper membermapper;

	@Override
	public int update(MemberDTO member) {
		
		return membermapper.update(member);
		
	}

	@Override
	public int passwordCheck(MemberDTO member) {
		// TODO Auto-generated method stub
		return membermapper.passwordCheck(member);
	}
	

}
