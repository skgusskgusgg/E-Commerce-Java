package org.team.mypage;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.domain.ProductVO;
import org.team.domain.ReplyVO;
import org.team.mapper.OrderMapper;


@Service
public class orderServiceImpl implements orderService {
	
	@Autowired
	OrderMapper ordermapper;


	@Override
	public List<orderDTO> orderListWithPaging(orderCriteria cri) {
		cri.setPageNum(cri.getPageNum()); 
		
		return ordermapper.orderListWithPaging(cri);
	}


	@Override
	public List<orderDTO> orderList(int id) {
		// TODO Auto-generated method stub
		return ordermapper.orderList(id);
	}


	@Override
	public int getTotalOrderCount(orderCriteria cri) {
		// TODO Auto-generated method stub
		return ordermapper.getTotalOrderCount(cri);
	}


	@Override
	public List<ReplyVO> replyManagement(int user_id) {
		List<ReplyVO> list = ordermapper.replyManagement(user_id); 
		return list;
	}


	@Override
	public ProductVO productList(int product_id) {
		ProductVO productList = ordermapper.productList(product_id);
		return productList;
	}




}
