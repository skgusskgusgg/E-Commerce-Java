package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.OrderVO;
import org.team.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;

	@Override
	public List<OrderVO> getOrderList(int member_id){
		
		return mapper.getOrderList(member_id);
	}
	
	@Override
	public void insertOrder(List<OrderVO> oVOList) {
		mapper.insertOrder(oVOList);
	}
	
}
