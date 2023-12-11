package org.team.mapper;

import java.util.List;

import org.team.domain.OrderVO;

public interface OrderMapper {

	public List<OrderVO> getOrderList(int member_id);

	public void insertOrder(List<OrderVO> oVOList);
}
 