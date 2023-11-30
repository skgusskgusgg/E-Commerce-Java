package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.SearchMapper;
import org.team.product.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SearchServiceImpl implements SearchService {

	@Setter(onMethod_ = @Autowired)
	private SearchMapper mapper;

	@Override
	public List<ProductVO> getSearch(String keyword) {

		log.info("get......" + keyword);

		return mapper.search(keyword);

	}
	
}
