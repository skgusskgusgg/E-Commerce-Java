package org.team.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.domain.ReplyVO;
import org.team.member.MemberVO;
import org.team.mypage.orderCriteria;
import org.team.mypage.orderDTO;
import org.team.mypage.orderWithProductDTO;


public interface OrderMapper {

	
	public List<orderDTO> orderListWithPaging(@Param ("cri") orderCriteria cri, @Param("id") String id);

	public List<orderDTO> orderList(int id);

	public int getTotalOrderCount(@Param ("cri") orderCriteria cri);
	
	public List<ReplyVO> replyManagement(@Param("mVo")int user_id ,@Param("cri")orderCriteria cri);
	
	public int getReplyTotal(@Param("mVo") int mVo);

	public int getTotalOrderCount(@Param ("cri") orderCriteria cri, @Param("id") String id);

	public int deliveryPreparation(int id);

	public int deliveryIng(int id);

	public int deliveryComplete(int id);

	public List<orderWithProductDTO> orderWithProductWithPaging(@Param ("cri")orderCriteria cri , @Param("id") String id);

}
