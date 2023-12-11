package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.DeliveryVO;
import org.team.mapper.DeliveryMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Setter(onMethod_ = @Autowired)
	private DeliveryMapper mapper;

	@Override
	public List<DeliveryVO> getDeliveryList(int member_id){
		
		return mapper.getDeliveryList(member_id);
	}
	
	@Override
	public DeliveryVO insertDelivery(DeliveryVO dVO) {
		mapper.insertDelivery(dVO);
		Integer deliveryId = mapper.getDeliveryAutoIncrement();
		return mapper.getDelivery(deliveryId);
	}
	
}
