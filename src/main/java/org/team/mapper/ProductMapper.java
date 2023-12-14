package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.AddProducts;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getList(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high);

	// "1" : outer, "2" : top, "3" : pants
	public List<ProductVO> selectList(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high);

	public int getTotal(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high);
	
	public int selectTotal(@Param("vo") ProductVO vo, @Param("cri") Criteria cri,
			@Param("sort") String sort, @Param("row") int row, @Param("high") int high); 

	public ProductVO detail(int id);
	
	public int postWish(@Param("aVo") AddProducts aVo, @Param("mVo") int mVo );

	public int updateWish(@Param("aVo") ProductVO pVo, @Param("num") int count, @Param("mVo") int mVo);
	
	public int deleteWish(@Param("pVo") ProductVO Pvo,@Param("mVo") int mVo );
	
	public int countWish(@Param("product_id") int productId, @Param("member_id") int member_id);
	
	public int postCart(@Param("aVo") AddProducts aVo, @Param("mVo") int mVo);

	public int updateCart(@Param("pVo") ProductVO pVo, @Param("num") int count, @Param("mVo") int mVo);
	
	public List<String> sizeTotal(@Param("pVo") ProductVO pVo);
	
	public List<String> colorTotal(@Param("pVo") ProductVO pVo);
	
	public int checkWishProduct(@Param("product") ProductVO pVo, @Param("mVo") int mVo);
	
	public int checkCartProduct(@Param("product") ProductVO pVo, @Param("mVo") int mVo);

	public List<ProductVO> bestProducts();
}
