package org.team.admin;

import java.util.List;

import org.team.delivery.deliveryDTO;
import org.team.join.MemberDTO;
import org.team.mypage.orderDTO;

public interface AdminService {
	public List<MemberDTO> memberList(AdminCriteria cri);

	public int memberTotal();

	public int deleteMember(String id);

	public int modifyMember(MemberDTO member);

	public int keywordMemberTotal(String keyword);

	public List<MemberDTO> keywordMemberList(AdminCriteria cri, String keyword);

	public int orderTotal();

	public List<orderDTO> orderList(AdminCriteria cri);

	public int deliveryTotal();

	public List<deliveryDTO> deliveryList(AdminCriteria cri);

	public int deleteOrder(Integer id);

	public List<orderDTO> orderKeywordSearch(String orderSort, Integer keyword, AdminCriteria cri);

	public int orderKeywordSearchTotal(String orderSort, Integer keyword);
}
