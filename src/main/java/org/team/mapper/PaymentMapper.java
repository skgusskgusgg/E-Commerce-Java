package org.team.mapper;

import java.util.List;

import org.team.domain.PaymentInfoVO;
import org.team.domain.PaymentVO;

public interface PaymentMapper {

	public List<PaymentVO> getPaymentList(int member_id);
	
	public PaymentVO getPayment(Integer paymentId);
	
	public Integer insertPayment(PaymentVO pVO);
	
	public void updatePoint(PaymentInfoVO paymentInfo);
	
	public Integer getPaymentAutoIncrement();
}
 