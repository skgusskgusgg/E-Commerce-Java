package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.mapper.ProductMapper;

import lombok.Setter;

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
	public int postWish(ProductVO pVo, int mVo) {
		int result =  mapper.postWish(pVo, mVo);	
		return result;
	}



	@Override
	public int deleteWish(ProductVO pVo, int mVo) {
	  int result = mapper.deleteWish(pVo, mVo);
		return result;
	}



	@Override
	public boolean countWish(int product_id, int member_id) {
		int count = mapper.countWish(product_id, member_id);
		return count > 0;
	}



	@Override
	public int postCart(ProductVO pVo, int mVo, int count) {
		int result = mapper.postCart(pVo, mVo, count);
		return result;
	}
	
}
