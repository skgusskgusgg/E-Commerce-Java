package org.team.mypage;

public class orderDTO {
	private Integer order_id;
	private Integer delivery_id;
	private Integer product_id;
	private Integer product_count;
	private Integer price;
	private Integer status;
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(Integer delivery_id) {
		this.delivery_id = delivery_id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Integer getProduct_count() {
		return product_count;
	}
	public void setProduct_count(Integer product_count) {
		this.product_count = product_count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "orderDTO [order_id=" + order_id + ", delivery_id=" + delivery_id + ", product_id=" + product_id
				+ ", product_count=" + product_count + ", price=" + price + ", status=" + status + "]";
	}

}
