package org.team.service;

import java.util.List;

import org.team.domain.Criteria;
import org.team.domain.ProductVO;

public interface AdminProductService {
	public List<ProductVO> getList(Criteria cri);

	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high);
	
	public int getTotal();
	
	public int selectTotal(ProductVO vo, Criteria cri, String sort, int row, int high);

	public ProductVO detail(int id);
	
	public int register(ProductVO pVo);
	
	public int update(ProductVO pVo);
	
	public int delete(int pVo);
}
