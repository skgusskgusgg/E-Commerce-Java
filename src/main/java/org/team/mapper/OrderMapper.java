package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.mypage.orderCriteria;
import org.team.mypage.orderDTO;


public interface OrderMapper {

	
	public List<orderDTO> orderListWithPaging(@Param ("cri") orderCriteria cri);

	public List<orderDTO> orderList(int id);
	public int getTotalOrderCount(@Param ("cri") orderCriteria cri);
}
