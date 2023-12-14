package org.team.mypage;

import java.util.List;

public interface orderService {

		public List<orderDTO> orderListWithPaging(orderCriteria cri, String id);

		public List<orderDTO> orderList(int id);
		public int getTotalOrderCount(orderCriteria cri, String id);

		public int deliveryPreparation(int id);

		public int deliveryIng(int id);

		public int deliveryComplete(int id);
		

}
