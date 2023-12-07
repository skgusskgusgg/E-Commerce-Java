package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.admin.AdminCriteria;
import org.team.delivery.deliveryDTO;
import org.team.join.MemberDTO;
import org.team.mypage.orderDTO;


public interface AdminMapper {
	
	
	public List<MemberDTO> memberList (@Param("cri") AdminCriteria cri);

	public int memberTotal();

	public int deleteMember(String id);

	public int modifyMember(MemberDTO member);

	public int keywordMemberTotal(String keyword);

	public List<MemberDTO> keywordMemberList(@Param("cri") AdminCriteria cri,@Param("keyword") String keyword);

	public int orderTotal();

	public List<orderDTO> orderList(@Param("cri") AdminCriteria cri);

	public int deliveryTotal();

	public List<deliveryDTO> deliveryList(@Param("cri") AdminCriteria cri);

	public int deleteOrder(Integer id);

	public List<orderDTO> orderKeywordSearch(@Param("orderSort")String orderSort, @Param("keyword")Integer keyword,@Param("cri") AdminCriteria cri);

	public int orderKeywordSearchTotal(@Param("orderSort") String orderSort,@Param("keyword") Integer keyword);

}
