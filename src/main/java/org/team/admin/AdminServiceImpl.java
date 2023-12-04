package org.team.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.join.MemberDTO;
import org.team.mapper.AdminMapper;


import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{

	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminmapper;
	
	@Override
	public List<MemberDTO> memberList(AdminCriteria cri) {
		
		
		return adminmapper.memberList(cri);
	}

	@Override
	public int memberTotal() {
		// TODO Auto-generated method stub
		return adminmapper.memberTotal();
	}

}
