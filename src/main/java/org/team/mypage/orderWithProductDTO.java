package org.team.mypage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString

public class orderWithProductDTO {
	private Integer order_id;
	private Integer delivery_id;
	private Integer product_count;
	private Integer product_price;
	private Integer status;
	private Integer product_id;
	private String category_id;
	private String product_name;
	private String img;
	private Integer sell_count;
	private Integer price;
	private String color_id;
	private String size_id;
	
	
}
