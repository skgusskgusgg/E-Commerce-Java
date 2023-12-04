package org.team.mapper;

import java.util.List;

import org.team.product.ProductVO;

public interface SearchMapper {

	public List<ProductVO> search(String keyword);

}
 