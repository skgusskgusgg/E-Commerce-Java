package org.team.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductDetailResponse {
	   private ProductVO productDetail;
	    private List<String> sizeTotal;
	    private List<String> colorTotal;
}
