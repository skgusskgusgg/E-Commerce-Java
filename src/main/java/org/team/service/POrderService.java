package org.team.service;

import java.util.List;

import org.team.domain.OrderVO;

public interface POrderService {

	public List<OrderVO> getOrderList(int member_id);
	
	public void insertOrder(List<OrderVO> oVOList);
}
