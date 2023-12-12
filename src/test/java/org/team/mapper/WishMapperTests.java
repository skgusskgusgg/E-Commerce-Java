package org.team.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.domain.AddProducts;
import org.team.domain.ProductVO;
import org.team.member.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WishMapperTests {
	@Setter(onMethod_ = @Autowired)
	private WishMapper mapper;
	
	@Test
	public void getList() {
		List<ProductVO> list = mapper.getWishList(2);
		list.forEach(li -> log.info(li));
	}
	@Test
	public void deleteWish() {
	
		List<Integer> list = new ArrayList<Integer>();
		list.add(101);
		list.add(102);
		mapper.deleteWish(list, 2);
	}
	@Test
	public void postCart() {
		// 51
		AddProducts pVo1 =new AddProducts();
		pVo1.getProduct().setColor_id("red");
		pVo1.getProduct().setProduct_name("Aviator Bomber");
		pVo1.getProduct().setSize_id("S");
		pVo1.setCount(3);
		
		// 61
		AddProducts pVo2 = new AddProducts();
		pVo2.getProduct().setColor_id("black");
		pVo2.getProduct().setProduct_name("Sophisticated Pea Coat");
		pVo2.getProduct().setSize_id("S");
		pVo2.setCount(10);
		
		List<AddProducts> list = new ArrayList<AddProducts>();
		list.add(pVo1);
		list.add(pVo2);
		
		int check = mapper.checkCartProduct(list, 2);
		log.info(check);
		 
		if(check > 0) {
			mapper.updateCart(list, 2);
		}else {
			mapper.addCart(list, 2);
		}
	
		
	}
	@Test 
	public void wishTotal() {
		
		int result = mapper.wishTotal(1);
		log.info(result);
	}
}
