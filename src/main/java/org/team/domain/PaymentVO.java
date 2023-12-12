package org.team.domain;

import lombok.Data;

@Data
public class PaymentVO {
	private int payment_id;
	private int member_id;
	private double total_price;
	private String payment_method;
	private double point;
	private String paymentdate;
	private int canceled;
}
