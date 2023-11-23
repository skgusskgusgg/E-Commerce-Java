package org.team.mapper;

import java.util.List;

import org.team.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getList();
	
	// "1" : outer, "2" : top, "3" : pants
	public List<ProductVO> selectList(String category_id);	
}
