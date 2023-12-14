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

	public List<orderDTO> orderKeywordSearch(@Param("orderSort")String orderSort, @Param("keyword")String keyword,@Param("cri") AdminCriteria cri);

	public int orderKeywordSearchTotal(@Param("orderSort") String orderSort,@Param("keyword") String keyword);

	public int modifyOrder(orderDTO order);
	
	public int updateDeliveryTotalPrice(Integer delivery_id);

	public int deliveryPreparing(Integer delivery_id);

	public int deliveryIng(Integer delivery_id);

	public int deliveryEnd(Integer delivery_id);

	public deliveryDTO getDeliveryById(String id);

	public int deliveryKeywordSearchTotal(@Param("deliverySort") String deliverySort, @Param("keyword") String keyword);

	public List<deliveryDTO> deliveryKeywordSearch(@Param("deliverySort") String deliverySort, @Param("keyword") String keyword,@Param("cri") AdminCriteria cri);

	public int modifyDelivery (deliveryDTO mDTO);

	public int totalDeliveryPre(Integer delivery_id);

	public int totalDeliveryComplete(Integer delivery_id);

	public int totalDeliveryIng(Integer delivery_id);

	public int modifyOrders(@Param("delivery_id")Integer delivery_id, @Param("status") Integer status);

	public int deleteOrders(String delivery_id);

	public int deleteDelivery(String delivery_id);

	public List<deliveryDTO> getordersById(String id);

}
