package org.team.domain;

import lombok.Data;

@Data
public class OrderVO {
	private int order_id;
	private int delivery_id;
	private int product_id;
	private int product_count;
	private int price;
	private String status;
}
