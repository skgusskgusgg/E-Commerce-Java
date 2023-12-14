package org.team.service;

import java.util.List;

import org.team.domain.AddProducts;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> getList(ProductVO vo, Criteria cri, String sort, int row, int high);

	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high);
	
	public int getTotal(ProductVO vo, Criteria cri, String sort, int row, int high);
	
	public int selectTotal(ProductVO vo, Criteria cri, String sort, int row, int high);

	public ProductVO detail(int id);
	
	public int postWish(AddProducts aVo, int mVo);
	
	public int deleteWish(ProductVO pVo, int mDto);
	
	public boolean countWish(int product_id, int member_id);
	
	public int postCart(AddProducts aVo, int mVo);
	
	public List<String> sizeTotal(ProductVO pVo);
	
	public List<String> colorTotal(ProductVO pVo);
	
	public int updateWish(ProductVO pVo, int count, int mVo);
	
	public int updateCart(ProductVO pVo, int count, int mVo);
	
	public int checkWishProduct(ProductVO pVo, int mVo);
	
	public int checkCartProduct(ProductVO pVo, int mVo);

	public List<ProductVO> bestProducts();
}
