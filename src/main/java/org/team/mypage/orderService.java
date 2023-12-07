package org.team.mypage;

import java.util.List;

public interface orderService {

		public List<orderDTO> orderListWithPaging(orderCriteria cri);

		public List<orderDTO> orderList(int id);
		public int getTotalOrderCount(orderCriteria cri);
		

}
