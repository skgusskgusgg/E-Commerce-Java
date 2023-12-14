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

	public int deleteOrder(Integer id);

	public List<orderDTO> orderKeywordSearch(String orderSort, String keyword, AdminCriteria cri);

	public int orderKeywordSearchTotal(String orderSort, String keyword);

	public int modifyOrder(orderDTO order);

	public int updateDeliveryTotalPrice(Integer delivery_id);

	public int deliveryPreparing(Integer delivery_id);

	public int deliveryIng(Integer delivery_id);

	public int deliveryEnd(Integer delivery_id);
	
	public int deliveryTotal();

	public List<deliveryDTO> deliveryList(AdminCriteria cri);

	public deliveryDTO getDeliveryById(String id);

	public int deliveryKeywordSearchTotal(String deliverySort, String keyword);

	public List<deliveryDTO> deliveryKeywordSearch(String deliverySort, String keyword, AdminCriteria cri);

	public int modifyDelivery(deliveryDTO mDTO);

	public int totalDeliveryPre(Integer delivery_id);

	public int totalDeliveryComplete(Integer delivery_id);

	public int totalDeliveryIng(Integer delivery_id);

	public int modifyOrders(Integer delivery_id, Integer status);

	public int deleteOrders(String delivery_id);

	public int deleteDelivery(String delivery_id);

	public List<deliveryDTO> getordersById(String id);
}
