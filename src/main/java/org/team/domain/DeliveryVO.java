package org.team.domain;

import lombok.Data;

@Data
public class DeliveryVO {
	private int delivery_id;
	private int member_id;
	private int payment_id;
	private String regdate;
	private String total_status;	
	private String address;
	private String extraAddress;
	private String zipcode;
}
