package org.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.cart.CartVO;
import org.team.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public List<CartVO> getCartList(int member_id) {

		log.info("get cart list..." + member_id);

		return mapper.getCartList(member_id);

	}
	
	@Override
	public Integer getCartCount(int member_id){
		log.info("get cart count..." + member_id);

		return mapper.getCartCount(member_id);
	}
	
	@Override
	public boolean deleteCartList(List<String> cartSelectList) {
		log.info("Delete cart list..." + cartSelectList);
		return mapper.deleteCartList(cartSelectList);
	}
	
	@Override
	public boolean updateCartAmount(Map<String,String> amountMap) {
		log.info("Update cart amount..." + amountMap);
		return mapper.updateCartAmount(amountMap);
	}
	
	@Override
	public void deleteCurrentCart(int member_id) {
		log.info("Delete current cart..." + member_id);
		mapper.deleteCurrentCart(member_id);
	}
	
}
