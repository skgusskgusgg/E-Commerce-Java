package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.AddProducts;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getList(@Param("cri") Criteria cri);

	// "1" : outer, "2" : top, "3" : pants
	public List<ProductVO> selectList(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high);

	public int getTotal();
	
	public int selectTotal(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high); 

	public ProductVO detail(int id);
	
	public int postWish(@Param("pVo") ProductVO Pvo,@Param("mVo") int mVo );

	public int deleteWish(@Param("pVo") ProductVO Pvo,@Param("mVo") int mVo );
	
	public int countWish(@Param("product_id") int productId, @Param("member_id") int member_id);
	
	public int postCart(@Param("aVo") AddProducts aVo, @Param("mVo") int mVo);

	
}
