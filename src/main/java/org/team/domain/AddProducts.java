package org.team.domain;


import lombok.Data;

@Data
public class AddProducts {
	private ProductVO product;
	private int count;
	
	 // 생성자 추가
    public AddProducts() {
        this.product = new ProductVO();
    }
}
