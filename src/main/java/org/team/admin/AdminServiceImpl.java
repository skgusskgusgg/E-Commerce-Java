package org.team.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.delivery.deliveryDTO;
import org.team.join.MemberDTO;
import org.team.mapper.AdminMapper;
import org.team.mypage.orderDTO;

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

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return adminmapper.deleteMember(id);
	}

	@Override
	public int modifyMember(MemberDTO member) {
		// TODO Auto-generated method stub
		return adminmapper.modifyMember(member);
	}

	@Override
	public int keywordMemberTotal(String keyword) {
		// TODO Auto-generated method stub
		return adminmapper.keywordMemberTotal(keyword);
	}

	@Override
	public List<MemberDTO> keywordMemberList(AdminCriteria cri, String keyword) {
		// TODO Auto-generated method stub
		return adminmapper.keywordMemberList(cri, keyword);
	}

	@Override
	public int orderTotal() {
		// TODO Auto-generated method stub
		return adminmapper.orderTotal();
	}

	@Override
	public List<orderDTO> orderList(AdminCriteria cri) {
		// TODO Auto-generated method stub
		return adminmapper.orderList(cri);
	}


	@Override
	public int deleteOrder(Integer id) {
		// TODO Auto-generated method stub
		return adminmapper.deleteOrder(id);
	}

	@Override
	public List<orderDTO> orderKeywordSearch(String orderSort, String keyword, AdminCriteria cri) {
		// TODO Auto-generated method stub
		return adminmapper.orderKeywordSearch(orderSort, keyword, cri);
	}

	@Override
	public int orderKeywordSearchTotal(String orderSort, String keyword) {
		// TODO Auto-generated method stub
		return adminmapper.orderKeywordSearchTotal(orderSort, keyword);
	}

	@Override
	public int modifyOrder(orderDTO order) {
		// TODO Auto-generated method stub
		return adminmapper.modifyOrder(order);
	}

	@Override
	public int updateDeliveryTotalPrice(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.updateDeliveryTotalPrice(delivery_id);
	}

	@Override
	public int deliveryPreparing(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryPreparing(delivery_id);
	}

	@Override
	public int deliveryIng(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryIng(delivery_id);
	}

	@Override
	public int deliveryEnd(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryEnd(delivery_id);
	}
	
	@Override
	public int deliveryTotal() {
		// TODO Auto-generated method stub
		return adminmapper.deliveryTotal();
	}

	@Override
	public List<deliveryDTO> deliveryList(AdminCriteria cri) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryList(cri);
	}

	@Override
	public deliveryDTO getDeliveryById(String id) {
		// TODO Auto-generated method stub
		return adminmapper.getDeliveryById(id);
	}

	@Override
	public int deliveryKeywordSearchTotal(String deliverySort, String keyword) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryKeywordSearchTotal(deliverySort, keyword);
	}

	@Override
	public List<deliveryDTO> deliveryKeywordSearch(String deliverySort, String keyword, AdminCriteria cri) {
		// TODO Auto-generated method stub
		return adminmapper.deliveryKeywordSearch(deliverySort, keyword, cri);
	}

	@Override
	public int modifyDelivery(deliveryDTO mDTO) {
		// TODO Auto-generated method stub
		return adminmapper.modifyDelivery(mDTO);
	}

	@Override
	public int totalDeliveryPre(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.totalDeliveryPre(delivery_id);
	}

	@Override
	public int totalDeliveryComplete(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.totalDeliveryComplete(delivery_id);
	}

	@Override
	public int totalDeliveryIng(Integer delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.totalDeliveryIng(delivery_id);
	}

	@Override
	public int modifyOrders(Integer delivery_id, Integer status) {
		// TODO Auto-generated method stub
		return adminmapper.modifyOrders(delivery_id, status);
	}

	@Override
	public int deleteOrders(String delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.deleteOrders(delivery_id);
	}

	@Override
	public int deleteDelivery(String delivery_id) {
		// TODO Auto-generated method stub
		return adminmapper.deleteDelivery(delivery_id);
	}

	@Override
	public List<deliveryDTO> getordersById(String id) {
		// TODO Auto-generated method stub
		return adminmapper.getordersById(id);
	}

}
