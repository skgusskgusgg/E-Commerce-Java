package org.team.service;

import java.util.List;

import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.join.MemberDTO;
import org.team.member.MemberVO;

public interface ProductService {
	public List<ProductVO> getList(Criteria cri);

	public List<ProductVO> selectList(ProductVO vo, Criteria cri, String sort, int row, int high);
	
	public int getTotal();
	
	public int selectTotal(ProductVO vo, Criteria cri, String sort, int row, int high);

	public ProductVO detail(int id);
	
	public int postWish(ProductVO pVo, int mDto);
	
	public int deleteWish(ProductVO pVo, int mDto);
	
	public boolean countWish(int product_id, int member_id);
	
	public int postCart(ProductVO pVo, int mVo, int count);
}
