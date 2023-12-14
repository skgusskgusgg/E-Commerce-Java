package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.mapper.AdminProductMapper;

import lombok.Setter;

@Service
public class AdminProductServiceImpl  implements AdminProductService{
	@Setter(onMethod_ = @Autowired)
	private AdminProductMapper mapper;

	@Override
	public List<ProductVO> getList(ProductVO vo, Criteria cri, String sort, int row, int high) {
		List<ProductVO> list = mapper.getList(vo, cri, sort, row, high);
		return list;
	}

	@Override
	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high) {
		List<ProductVO> selectList = mapper.selectList(vo,cri,sort,row,high);
		return selectList;
	}

	@Override
	public int getTotal(ProductVO vo, Criteria cri, String sort, int row, int high) {
		int total =mapper.getTotal(vo, cri, sort, row, high);
		return total;
	}

	@Override
	public int selectTotal(ProductVO vo, Criteria cri, String sort, int row, int high) {
		int total = mapper.selectTotal(vo, cri, sort, row, high);
		return total;
	}

	@Override
	public ProductVO detail(int id) {
		ProductVO vo = mapper.detail(id);
		return vo;
	}

	@Override
	public int register(ProductVO pVo) {
		int result = mapper.register(pVo);
		return result;
	}

	@Override
	public int update(ProductVO pVo) {
		int result = mapper.update(pVo);
		return result;
	}

	@Override
	public int delete(int pVo) {
		int result = mapper.delete(pVo);
		return result;
	}
	
	
}
