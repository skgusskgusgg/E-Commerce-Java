package org.team.mypage;

import java.util.List;

import org.team.domain.Criteria;
import org.team.domain.ProductVO;
import org.team.domain.ReplyVO;

public interface orderService {

		public List<orderDTO> orderListWithPaging(orderCriteria cri, String id);

		public List<orderDTO> orderList(int id);
		public int getTotalOrderCount(orderCriteria cri, String id);

		public int deliveryPreparation(int id);

		public int deliveryIng(int id);

		public int deliveryComplete(int id);

		public List<orderWithProductDTO> orderWithProductWithPaging(orderCriteria cri, String id);
		
		public List<ReplyVO> replyManagement(int user_id, orderCriteria cri);
		
		public int getReplyTotal(int user_id);

}
