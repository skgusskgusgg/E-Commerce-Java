package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.domain.ReplyVO;
import org.team.mypage.orderCriteria;
import org.team.mypage.orderDTO;


public interface OrderMapper {

	
	public List<orderDTO> orderListWithPaging(@Param ("cri") orderCriteria cri);

	public List<orderDTO> orderList(int id);
	public int getTotalOrderCount(@Param ("cri") orderCriteria cri);
	
	public List<ReplyVO> replyManagement(@Param("mVo")int user_id );
	
	public ProductVO productList(@Param("pVo") int product_id);
}
