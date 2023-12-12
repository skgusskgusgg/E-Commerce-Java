package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.OrderVO;
import org.team.mypage.orderCriteria;
import org.team.mypage.orderDTO;


public interface POrderMapper {

	
	public List<orderDTO> orderListWithPaging(@Param ("cri") orderCriteria cri);

	public List<orderDTO> orderList(int id);
	public int getTotalOrderCount(@Param ("cri") orderCriteria cri);
	

	public List<OrderVO> getOrderList(int member_id);

	public void insertOrder(List<OrderVO> oVOList);
}
