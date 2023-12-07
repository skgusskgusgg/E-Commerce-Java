package org.team.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminProductTests {

	@Setter(onMethod_ = @Autowired)
	private AdminProductMapper mapper;
	
	@Test
	public void register() {
		ProductVO pVo = new ProductVO();
		pVo.setCategory_id("outer");
		pVo.setProduct_name("Elegance Trench");
		pVo.setPrice(280000);
		pVo.setImg("outer/13.jpg");
		pVo.setQuantity(100);
		pVo.setColor_id("black");
		pVo.setSize_id("S");
		mapper.register(pVo);
	}
	@Test 
	public void update() {
		ProductVO pVo = new ProductVO();
		pVo.setCategory_id("outer");
		pVo.setProduct_name("Elegance Trench");
		pVo.setPrice(280000);
		pVo.setImg("outer/13.jpg");
		pVo.setQuantity(100);
		pVo.setColor_id("black");
		pVo.setSize_id("S");
		pVo.setProduct_id(194);
		mapper.update(pVo);
	}
	
	@Test 
	public void delete() {
		mapper.delete(195);
	}
}
