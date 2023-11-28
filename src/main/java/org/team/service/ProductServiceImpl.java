package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;
import org.team.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
public class ProductServiceImpl implements ProductService{

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList(Criteria cri) {
		List<ProductVO> list = mapper.getList(cri);
		
		return list;
	}



	@Override
	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high) {
		List<ProductVO> selectList = mapper.selectList(vo,cri,sort,row,high);
		return selectList;
	}



	@Override
	public int getTotal() {
		int total = mapper.getTotal();
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
	public int postWish(ProductVO pVo, MemberDTO mDto) {
		int result =  mapper.postWish(pVo, mDto);	
		return result;
	}



	@Override
	public int deleteWish(ProductVO pVo, MemberDTO mDto) {
	  int result = mapper.deleteWish(pVo, mDto);
		return result;
	}
	
}
