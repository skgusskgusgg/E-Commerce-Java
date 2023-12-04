package org.team.admin;

import java.util.List;

import org.team.join.MemberDTO;

public interface AdminService {
	public List<MemberDTO> memberList(AdminCriteria cri);

	public int memberTotal();
}
