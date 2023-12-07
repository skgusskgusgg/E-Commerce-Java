package org.team.cart;

import lombok.Data;

@Data
public class CartVO {

	private int cart_id;
	private int member_id;
	private int product_id;
	private String product_name;
	private int count;
	private int price;
	private String img;
	private String color_id;
	private String size_id;

}
