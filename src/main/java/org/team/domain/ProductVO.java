package org.team.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int product_id;
	private String category_id;
	private String product_name;
	private int price;
	private String img;
	private int quantity;
	private int sell_count;
	private String color_id;
	private String size_id;
}
