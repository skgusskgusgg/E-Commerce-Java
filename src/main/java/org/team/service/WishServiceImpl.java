package org.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.AddProducts;
import org.team.domain.ProductVO;
import org.team.mapper.WishMapper;
import org.team.member.MemberVO;

import lombok.Setter;

@Service
public class WishServiceImpl implements WishService{
	@Setter(onMethod_ = @Autowired)
	private WishMapper mapper;

	@Override
	public List<ProductVO> getWishList(int member_id) {
		List<ProductVO> list = mapper.getWishList(member_id);
		return list;
	}

	@Override
	public int deleteWish(List<Integer>pVo, int member_id) {
		int result = mapper.deleteWish(pVo, member_id);
		return result;
	}

	@Override
	public int addCart(List<AddProducts> addVo, int member_id) {
		int result = mapper.addCart(addVo, member_id);
		return result;
	}

	@Override
	public int wishTotal(int mVo) {
		int result = mapper.wishTotal(mVo);
		return result;
	}

	@Override
	public int cartTotal(int mVo) {
		int result = mapper.cartTotal(mVo);
		return result;
	}
	
}
