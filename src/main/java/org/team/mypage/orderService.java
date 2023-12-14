package org.team.mypage;

import java.util.List;

import org.team.domain.ProductVO;
import org.team.domain.ReplyVO;

public interface orderService {

		public List<orderDTO> orderListWithPaging(orderCriteria cri);

		public List<orderDTO> orderList(int id);
		public int getTotalOrderCount(orderCriteria cri);
		
		public List<ReplyVO> replyManagement(int user_id);
		
		public ProductVO productList(int product_id);
}
