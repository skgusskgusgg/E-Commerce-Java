package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
public class ProductServiceImpl implements ProductService{

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList() {
		List<ProductVO> list = mapper.getList();
		
		return list;
	}

	@Override
	public List<ProductVO> selectList(ProductVO vo, Criteria cri,String sort) {
		List<ProductVO> selectList = mapper.selectList(vo,cri,sort);
		return selectList;
	}
	
}
