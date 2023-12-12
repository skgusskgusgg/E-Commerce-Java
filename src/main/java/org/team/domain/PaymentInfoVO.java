package org.team.domain;

import lombok.Data;

@Data
public class PaymentInfoVO {
	private Integer memberId;
	private String roadAddr;
	private String postCode;
	private String extraAddress;
	private String paymentMethod;
	private double usePoint;
	private double totalpaymentAmount;
}
