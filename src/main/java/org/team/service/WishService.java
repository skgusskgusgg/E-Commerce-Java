package org.team.service;

import java.util.List;

import org.team.domain.AddProducts;
import org.team.domain.ProductVO;
import org.team.member.MemberVO;

public interface WishService {
	public List<ProductVO> getWishList(int member_id);
	public int deleteWish(List<Integer>pVo, int member_id);
	public int addCart(List<AddProducts> addVo, int member_id);
	public int wishTotal(int mVo);
	public int cartTotal(int mVo);
}
