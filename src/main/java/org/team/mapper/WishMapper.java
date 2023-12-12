package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.AddProducts;
import org.team.domain.ProductVO;
import org.team.member.MemberVO;

public interface WishMapper {
	public List<ProductVO> getWishList(@Param("mVo") int  member_id);
	
	public int deleteWish(@Param("pVo") List<Integer> pVo, @Param("mVo") int member_id);
	
	public int addCart(@Param("addVo") List<AddProducts> addVo, @Param("mVo") int mVo);
	
	public int wishTotal(@Param("mVo") int mVo);
	
	public int cartTotal(@Param("mVo") int mVo);
	
	public int updateCart(@Param("addVo")  List<AddProducts> aVo, @Param("mVo") int mVo);
	
	public int checkCartProduct(@Param("addVo") List<AddProducts> aVo, @Param("mVo") int mVo);
}
