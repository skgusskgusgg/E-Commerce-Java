package org.team.service;

import java.util.List;

import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;

public interface ProductService {
	public List<ProductVO> getList(Criteria cri);

	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high);
	
	public int getTotal();
	
	public int selectTotal(ProductVO vo, Criteria cri, String sort, int row, int high);

	public ProductVO detail(int id);
	
	public int postWish(ProductVO pVo, MemberDTO mDto);
	
	public int deleteWish(ProductVO pVo, MemberDTO mDto);
}
