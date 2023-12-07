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
	public int deleteOrder(Integer id) {
		// TODO Auto-generated method stub
		return adminmapper.deleteOrder(id);
	}

	@Override
	public List<orderDTO> orderKeywordSearch(String orderSort, Integer keyword, AdminCriteria cri) {
		// TODO Auto-generated method stub
		return adminmapper.orderKeywordSearch(orderSort, keyword, cri);
	}

	@Override
	public int orderKeywordSearchTotal(String orderSort, Integer keyword) {
		// TODO Auto-generated method stub
		return adminmapper.orderKeywordSearchTotal(orderSort, keyword);
	}

}
