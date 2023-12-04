package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.admin.AdminCriteria;
import org.team.join.MemberDTO;


public interface AdminMapper {
	
	
	public List<MemberDTO> memberList (@Param("cri") AdminCriteria cri);

	public int memberTotal();

}
