package org.team.service;

import java.util.List;

import org.team.domain.DeliveryVO;

public interface DeliveryService {

	public List<DeliveryVO> getDeliveryList(int member_id);

	public DeliveryVO insertDelivery(DeliveryVO dVO);
}
