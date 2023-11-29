package org.team.service;

import java.util.List;

import org.team.product.ProductVO;

public interface SearchService {

	public List<ProductVO> getSearch(String keyword);
}
