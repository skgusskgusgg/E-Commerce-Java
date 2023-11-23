package org.team.service;

import java.util.List;

import org.team.domain.Criteria;
import org.team.domain.ProductVO;


public interface ProductService {
	public List<ProductVO> getList();
	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort);
}
