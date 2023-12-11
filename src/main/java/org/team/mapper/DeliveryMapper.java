package org.team.mapper;

import java.util.List;

import org.team.domain.DeliveryVO;

public interface DeliveryMapper {

	public List<DeliveryVO> getDeliveryList(int member_id);
	
	public DeliveryVO getDelivery(Integer deliveryId);
	
	public Integer insertDelivery(DeliveryVO dVO);
	
	public Integer getDeliveryAutoIncrement();
}
 