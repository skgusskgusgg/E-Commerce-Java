package org.team.mypage;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.OrderMapper;


@Service
public class orderServiceImpl implements orderService {
	
	@Autowired
	OrderMapper ordermapper;


	@Override
	public List<orderDTO> orderListWithPaging(orderCriteria cri) {
		cri.setPageNum(cri.getPageNum()); 
		
		return ordermapper.orderListWithPaging(cri);
	}


	@Override
	public List<orderDTO> orderList(int id) {
		// TODO Auto-generated method stub
		return ordermapper.orderList(id);
	}


	@Override
	public int getTotalOrderCount(orderCriteria cri) {
		// TODO Auto-generated method stub
		return ordermapper.getTotalOrderCount(cri);
	}




}
