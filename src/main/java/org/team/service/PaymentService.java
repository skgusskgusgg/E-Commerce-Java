package org.team.service;

import java.util.List;

import org.team.domain.PaymentInfoVO;
import org.team.domain.PaymentVO;
import org.team.member.MemberVO;

public interface PaymentService {

	public List<PaymentVO> getPaymentList(int member_id);
	
	public PaymentVO insertPayment(PaymentVO dVO);
	
	public void updatePoint(PaymentInfoVO paymentInfo);
	
	public MemberVO getMember(MemberVO mVO);
}
