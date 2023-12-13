package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.PaymentInfoVO;
import org.team.domain.PaymentVO;
import org.team.mapper.PaymentMapper;
import org.team.member.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {

	@Setter(onMethod_ = @Autowired)
	private PaymentMapper mapper;

	@Override
	public List<PaymentVO> getPaymentList(int member_id){
		
		return mapper.getPaymentList(member_id);
	}
	@Override
	public PaymentVO insertPayment(PaymentVO pVO) {
		mapper.insertPayment(pVO);
		Integer paymentId = mapper.getPaymentAutoIncrement();
		return mapper.getPayment(paymentId);
	}
	@Override
	public void updatePoint(PaymentInfoVO paymentInfo) {
		mapper.updatePoint(paymentInfo);
	}
	
	@Override
	public MemberVO getMember(MemberVO mVO) {
		return mapper.getMember(mVO);
	}

}
