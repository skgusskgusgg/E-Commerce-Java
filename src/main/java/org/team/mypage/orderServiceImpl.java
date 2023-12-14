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
	public List<orderDTO> orderListWithPaging(orderCriteria cri, String id) {
		
		
		return ordermapper.orderListWithPaging(cri, id);
	}


	@Override
	public List<orderDTO> orderList(int id) {
		// TODO Auto-generated method stub
		return ordermapper.orderList(id);
	}


	@Override
	public int getTotalOrderCount(orderCriteria cri, String id) {
		// TODO Auto-generated method stub
		return ordermapper.getTotalOrderCount(cri, id);
	}


	@Override
	public int deliveryPreparation(int id) {
		// TODO Auto-generated method stub
		return ordermapper.deliveryPreparation(id);
	}


	@Override
	public int deliveryIng(int id) {
		// TODO Auto-generated method stub
		return ordermapper.deliveryIng(id);
	}


	@Override
	public int deliveryComplete(int id) {
		// TODO Auto-generated method stub
		return ordermapper.deliveryComplete(id);
	}


	@Override
	public List<orderWithProductDTO> orderWithProductWithPaging(orderCriteria cri, String id) {
		// TODO Auto-generated method stub
		return ordermapper.orderWithProductWithPaging(cri, id);
	}




}
